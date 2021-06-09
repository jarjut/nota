import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app/app.dart';
import 'app/bloc/authentication_bloc.dart';
import 'app/bloc_observer.dart';
import 'features/notes/bloc/notes_bloc.dart';
import 'repositories/authentication_repository.dart';
import 'repositories/notes_repository.dart';

void main() async {
  Bloc.observer = AppBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  final authenticationRepository = AuthenticationRepository();
  final firebaseNoteRepository = FirebaseNotesRepository();

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
        ],
        child: const App(),
      ),
    ),
  );
}
