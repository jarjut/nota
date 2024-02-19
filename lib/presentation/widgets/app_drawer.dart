import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nota/application/auth/auth_bloc.dart';
import 'package:nota/core/utils/mediaquery_util.dart';
import 'package:nota/presentation/l10n/l10n.dart';
import 'package:nota/presentation/pages/settings/settings_column.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQueryUtil(context);

    bool isSelected(String routeName) {
      return GoRouterState.of(context).uri.toString() == routeName;
    }

    Future<void> showLogoutDialog() async {
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
                  context
                      .read<AuthBloc>()
                      .add(const AuthEvent.logoutRequested());
                  Navigator.pop(context);
                },
                child: const Text('Logout'),
              ),
            ],
          );
        },
      );
    }

    Future<void> showSettingsDialog() async {
      return showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            elevation: 3,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            child: Container(
              width: 400,
              padding: const EdgeInsets.all(12),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(
                    child: Text(
                      context.l10n.settingsPageTitle,
                      style: const TextStyle(
                        fontSize: 24,
                      ),
                    ),
                  ),
                  const SettingsColumn(),
                ],
              ),
            ),
          );
        },
      );
    }

    return Drawer(
      elevation: mediaQuery.isDesktop() ? 0 : 16.0,
      child: SafeArea(
        child: ListTileTheme(
          selectedColor: Theme.of(context).textTheme.bodyLarge!.color,
          selectedTileColor: Theme.of(context).primaryColor.withOpacity(0.25),
          // selectedTileColor: Theme.of(context).brightness == Brightness.dark
          //     ? primaryColor.shade700.withAlpha(50)
          //     : primaryColor.shade200.withAlpha(100),
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
              if (!mediaQuery.isDesktop())
                Container(
                  height: kToolbarHeight,
                  padding: const EdgeInsets.only(left: 16),
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      SizedBox(
                        height: 36,
                        child: Image.asset('assets/icons/nota-icon.png'),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        'Nota',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ],
                  ),
                )
              else
                const SizedBox.shrink(),
              if (!mediaQuery.isDesktop())
                const Divider(
                  height: 1,
                  thickness: 1,
                )
              else
                const SizedBox.shrink(),
              const SizedBox(height: 8),
              ListTile(
                leading: const Icon(Icons.article),
                title: const Text('Notes'),
                onTap: () {
                  context.go('/notes');
                  if (mediaQuery.isMobile()) {
                    Navigator.pop(context);
                  }
                },
                selected: isSelected('/notes'),
              ),
              ListTile(
                leading: const Icon(Icons.archive),
                title: const Text('Archive'),
                onTap: () {
                  context.go('/archive');
                  if (mediaQuery.isMobile()) {
                    Navigator.pop(context);
                  }
                },
                selected: isSelected('/archive'),
              ),
              ListTile(
                leading: const Icon(Icons.delete),
                title: const Text('Trash'),
                onTap: () {
                  context.go('/trash');
                  if (mediaQuery.isMobile()) {
                    Navigator.pop(context);
                  }
                },
                selected: isSelected('/trash'),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Divider(
                  height: 1,
                  thickness: 1,
                ),
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Settings'),
                onTap: () {
                  if (!mediaQuery.isMobile()) {
                    showSettingsDialog();
                  } else {
                    context.push('/settings');
                  }
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('Logout'),
                onTap: showLogoutDialog,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
