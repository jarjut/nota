import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vrouter/vrouter.dart';

import '../features/auth/login/login_page.dart';
import '../features/notes/add_note_page.dart';
import '../features/notes/notes_page.dart';
import '../repositories/authentication_repository.dart';

class AppRoute extends VRouteElementBuilder {
  AppRoute(this.context);

  final BuildContext context;

  bool isLoggedIn() =>
      context.read<AuthenticationRepository>().currentUser.isNotEmpty;

  @override
  List<VRouteElement> buildRoutes() {
    return [
      VWidget(path: '/login', widget: const LoginPage()),
      VGuard(
        beforeEnter: (vRedirector) async =>
            isLoggedIn() ? null : vRedirector.push('/login'),
        stackedRoutes: [
          VWidget(
            path: '/',
            widget: const NotesPage(),
            stackedRoutes: [
              VWidget(path: '/notes/add', widget: const AddNotePage()),
            ],
          ),
        ],
      ),
    ];
  }
}
