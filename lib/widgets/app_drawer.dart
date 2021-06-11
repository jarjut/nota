import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vrouter/vrouter.dart';

import '../app/bloc/authentication_bloc.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isSelected(String path) => context.vRouter.path == path;

    return Drawer(
      child: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Nota',
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            const Divider(
              height: 1,
              thickness: 1,
            ),
            ListTile(
              leading: const Icon(Icons.article),
              title: const Text('Notes'),
              onTap: () {
                context.vRouter.push('/');
              },
              selected: isSelected('/'),
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                BlocProvider.of<AuthenticationBloc>(context)
                    .add(AuthLogoutRequested());
              },
            ),
          ],
        ),
      ),
    );
  }
}
