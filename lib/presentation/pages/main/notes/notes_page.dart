import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nota/application/auth/auth_bloc.dart';
import 'package:nota/domain/auth/i_auth_facade.dart';
import 'package:nota/domain/notes/i_note_repository.dart';
import 'package:nota/injection.dart';

class NotesPage extends StatelessWidget {
  const NotesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                final uid = state.user.id;
                final notes = getIt<INoteRepository>().watchAll(uid);
                return StreamBuilder(
                  stream: notes,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Text(snapshot.data.toString());
                    }
                    return const CircularProgressIndicator();
                  },
                );
              },
            ),
            TextButton(
              onPressed: () {
                GoRouter.of(context).go('/login');
              },
              child: const Text('Login'),
            ),
            TextButton(
              onPressed: () {
                getIt<IAuthFacade>().signOut();
              },
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
