import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vrouter/vrouter.dart';

import '../features/main/notes/bloc/notes_bloc.dart';
import '../features/main/settings/theme_cubit.dart';
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
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state.status == AuthenticationStatus.authenticated) {
          BlocProvider.of<NotesBloc>(context).add(LoadNotes(state.user.id));
        }
      },
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, state) {
          return VRouter(
            debugShowCheckedModeBanner: false,
            title: 'Nota',
            themeMode: state,
            theme: AppTheme(),
            darkTheme: DarkTheme(),
            buildTransition: (animation1, _, child) {
              return FadeTransition(
                opacity: animation1,
                child: child,
              );
            },
            mode: VRouterMode.history,
            routes: [AppRoute(context)],
          );
        },
      ),
    );
  }
}
