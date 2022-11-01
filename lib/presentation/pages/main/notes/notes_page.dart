import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nota/domain/auth/i_auth_repository.dart';
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
            TextButton(
              onPressed: () {
                GoRouter.of(context).push('/login');
              },
              child: const Text('Login'),
            ),
            TextButton(
              onPressed: () {
                getIt<IAuthRepository>().signOut();
              },
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
