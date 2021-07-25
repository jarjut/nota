import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nota/app/app_route.dart';
import 'package:nota/app/theme.dart';
import 'package:nota/constants/breakpoints.dart';
import 'package:vrouter/vrouter.dart';

import '../app/bloc/authentication_bloc.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    bool isSelected(String routeName) =>
        context.vRouter.names.first == routeName;
    final isDesktop = size.width > kDesktopBreakpoint;

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
                  child: const Text('Logout'),
                ),
              ],
            );
          });
    }

    return Drawer(
      elevation: isDesktop ? 0 : 16.0,
      child: SafeArea(
        child: ListTileTheme(
          selectedColor: Theme.of(context).textTheme.bodyText1!.color,
          selectedTileColor: Theme.of(context).brightness == Brightness.dark
              ? primaryColor.shade700.withAlpha(50)
              : primaryColor.shade200.withAlpha(100),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(50),
              bottomRight: Radius.circular(50),
            ),
          ),
          textColor: Theme.of(context).brightness == Brightness.dark
              ? Colors.white70
              : Colors.black87,
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              !isDesktop
                  ? Container(
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
                    )
                  : const SizedBox.shrink(),
              !isDesktop
                  ? const Divider(
                      height: 1,
                      thickness: 1,
                    )
                  : const SizedBox.shrink(),
              const SizedBox(height: 8.0),
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
      ),
    );
  }
}
