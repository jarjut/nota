import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nota/app/app_route.dart';
import 'package:vrouter/vrouter.dart';

import '../app/bloc/authentication_bloc.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isSelected(String routeName) =>
        context.vRouter.names.first == routeName;

    Future<void> _showLogoutDialog() async {
      return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Logout'),
              content: const Text('Are you sure you want to logout?'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    BlocProvider.of<AuthenticationBloc>(context)
                        .add(AuthLogoutRequested());
                    Navigator.pop(context);
                  },
                  child: const Text('Delete'),
                ),
              ],
            );
          });
    }

    return Drawer(
      child: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              height: kToolbarHeight,
              padding: const EdgeInsets.only(left: 16.0),
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  SizedBox(
                    height: 36.0,
                    child: Image.asset('assets/icons/nota-icon.png'),
                  ),
                  const SizedBox(width: 12.0),
                  Text(
                    'Nota',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ],
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
                context.vRouter.toNamed(AppRoute.NotesRoute);
              },
              selected: isSelected(AppRoute.NotesRoute),
            ),
            ListTile(
              leading: const Icon(Icons.archive),
              title: const Text('Archive'),
              onTap: () {
                context.vRouter.toNamed(AppRoute.ArchiveRoute);
              },
              selected: isSelected(AppRoute.ArchiveRoute),
            ),
            ListTile(
              leading: const Icon(Icons.delete),
              title: const Text('Trash'),
              onTap: () {
                context.vRouter.toNamed(AppRoute.TrashRoute);
              },
              selected: isSelected(AppRoute.TrashRoute),
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                _showLogoutDialog();
              },
            ),
          ],
        ),
      ),
    );
  }
}
