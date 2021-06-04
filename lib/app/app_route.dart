import 'package:flutter/cupertino.dart';
import 'package:nota/repositories/authentication_repository.dart';
import 'package:vrouter/vrouter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../features/auth/login/login_page.dart';
import '../features/notes/notes_page.dart';

class AppRoute extends VRouteElementBuilder {
  AppRoute(this.context);

  final BuildContext context;

  bool isLoggedIn() =>
      context.read<AuthenticationRepository>().currentUser.isNotEmpty;

  @override
  List<VRouteElement> buildRoutes() {
    return [
      VWidget(path: '/login', widget: LoginPage()),
      VGuard(
        beforeEnter: (vRedirector) async =>
            isLoggedIn() ? null : vRedirector.push('/login'),
        stackedRoutes: [
          VWidget(path: '/', widget: NotesPage()),
        ],
      ),
    ];
  }
}
