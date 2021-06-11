import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vrouter/vrouter.dart';

import '../features/auth/login/login_page.dart';
import '../features/auth/register/register_page.dart';
import '../features/notes/add_note_page.dart';
import '../features/notes/note_page.dart';
import '../features/notes/notes_page.dart';
import '../repositories/authentication_repository.dart';
import 'bloc/authentication_bloc.dart';

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

  // Route Names
  static const String LoginRoute = 'loginRoute';
  static const String RegisterRoute = 'registerRoute';
  static const String NotesRoute = 'notesRoute';
  static const String AddNotesRoute = 'addNotesRoute';
  static const String NoteRoute = 'noteRoute';

  @override
  List<VRouteElement> buildRoutes() {
    return [
      VNester(
        path: null,
        widgetBuilder: (child) {
          return BlocListener<AuthenticationBloc, AuthenticationState>(
            listener: (context, state) {
              if (state.status == AuthenticationStatus.authenticated) {
                context.vRouter.pushNamed(NotesRoute);
              }
              if (state.status == AuthenticationStatus.unauthenticated) {
                context.vRouter.pushNamed(LoginRoute);
              }
            },
            child: child,
          );
        },
        nestedRoutes: [
          VGuard(
            beforeEnter: (vRedirector) async =>
                await isLoggedIn() ? vRedirector.pushNamed(NotesRoute) : null,
            stackedRoutes: [
              VWidget(
                path: '/login',
                name: LoginRoute,
                widget: const LoginPage(),
              ),
              VWidget(
                path: '/register',
                name: RegisterRoute,
                widget: const RegisterPage(),
              ),
            ],
          ),
          VGuard(
            beforeEnter: (vRedirector) async =>
                await isLoggedIn() ? null : vRedirector.pushNamed(LoginRoute),
            stackedRoutes: [
              VWidget(
                path: '/',
                name: NotesRoute,
                widget: const NotesPage(),
                stackedRoutes: [
                  VWidget(
                    path: '/notes/add',
                    name: AddNotesRoute,
                    widget: const AddNotePage(),
                  ),
                  VWidget(
                    path: '/note/:id',
                    name: NoteRoute,
                    widget: const NotePage(),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    ];
  }
}
