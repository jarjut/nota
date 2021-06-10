import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vrouter/vrouter.dart';

import '../features/notes/bloc/notes_bloc.dart';
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
      child: VRouter(
        title: 'Nota',
        theme: AppTheme(),
        darkTheme: DarkTheme(),
        routes: [AppRoute(context)],
      ),
    );
  }
}
