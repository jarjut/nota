import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nota/repositories/authentication_repository.dart';
import 'package:vrouter/vrouter.dart';

import 'app_route.dart';
import 'bloc/authentication_bloc.dart';
import 'theme.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => AuthenticationRepository(),
        )
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthenticationBloc(
              authenticationRepository:
                  context.read<AuthenticationRepository>(),
            ),
          ),
        ],
        child: VRouter(
          title: 'Nota',
          theme: theme,
          routes: [AppRoute()],
        ),
      ),
    );
  }
}
