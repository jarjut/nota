import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nota/repositories/authentication_repository.dart';
import 'package:vrouter/vrouter.dart';

class NotesPage extends StatelessWidget {
  const NotesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nota'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Notes Page'),
            ElevatedButton(
              onPressed: () {
                context.read<AuthenticationRepository>().logOut();
                context.vRouter.push('/login');
              },
              child: Text('LOGOUT'),
            )
          ],
        ),
      ),
    );
  }
}
