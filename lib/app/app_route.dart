import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vrouter/vrouter.dart';

import '../features/auth/login/login_page.dart';
import '../features/notes/add_note_page.dart';
import '../features/notes/note_page.dart';
import '../features/notes/notes_page.dart';
import '../repositories/authentication_repository.dart';

class AppRoute extends VRouteElementBuilder {
  AppRoute(this.context);

  final BuildContext context;

  Future<bool> isLoggedIn() async {
    var _authRepository =
        RepositoryProvider.of<AuthenticationRepository>(context);
    var user = _authRepository.currentUser;
    if (user.isEmpty) {
      user = await _authRepository.firstUserStateChange;
    }

    return user.isNotEmpty;
  }

  @override
  List<VRouteElement> buildRoutes() {
    return [
      VWidget(
        path: '/login',
        name: 'loginRoute',
        widget: const LoginPage(),
      ),
      VGuard(
        beforeEnter: (vRedirector) async =>
            await isLoggedIn() ? null : vRedirector.push('/login'),
        stackedRoutes: [
          VWidget(
            path: '/',
            name: 'notesRoute',
            widget: const NotesPage(),
            stackedRoutes: [
              VWidget(
                path: '/notes/add',
                name: 'addNoteRoute',
                widget: const AddNotePage(),
              ),
              VWidget(
                path: '/note/:id',
                name: 'noteRoute',
                widget: const NotePage(),
              )
            ],
          ),
        ],
      ),
    ];
  }
}
