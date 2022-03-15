import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/app.dart';
import 'app/bloc/authentication_bloc.dart';
import 'app/bloc_observer.dart';
import 'features/main/notes/bloc/notes_bloc.dart';
import 'features/main/settings/theme_cubit.dart';
import 'repositories/authentication_repository.dart';
import 'repositories/notes_repository.dart';

void main() async {
  BlocOverrides.runZoned(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp();

      final authenticationRepository = AuthenticationRepository();
      final firebaseNoteRepository = FirebaseNotesRepository();
      final prefs = await SharedPreferences.getInstance();

      runApp(
        MultiRepositoryProvider(
          providers: [
            RepositoryProvider(
              create: (context) => authenticationRepository,
              lazy: false,
            ),
            RepositoryProvider(
              create: (context) => firebaseNoteRepository,
            ),
          ],
          child: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => AuthenticationBloc(
                  authenticationRepository: authenticationRepository,
                ),
              ),
              BlocProvider(
                create: (context) => NotesBloc(
                  notesRepository: firebaseNoteRepository,
                ),
              ),
              BlocProvider(
                create: (context) => ThemeCubit(prefs: prefs)..getTheme(),
              ),
            ],
            child: const App(),
          ),
        ),
      );
    },
    blocObserver: AppBlocObserver(),
  );
}
