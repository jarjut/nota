import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nota/app/bloc_observer.dart';
import 'package:nota/features/notes/bloc/notes_bloc.dart';
import 'package:nota/repositories/notes_repository.dart';

import 'app/app.dart';
import 'app/bloc/authentication_bloc.dart';
import 'repositories/authentication_repository.dart';

void main() async {
  Bloc.observer = AppBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  final authenticationRepository = AuthenticationRepository();

  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => authenticationRepository,
          lazy: false,
        )
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
              notesRepository: FirebaseNotesRepository(),
            ),
          ),
        ],
        child: const App(),
      ),
    ),
  );
}
