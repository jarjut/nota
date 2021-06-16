import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nota/features/notes/search_notes_page.dart';
import 'package:vrouter/vrouter.dart';

import '../features/auth/login/login_page.dart';
import '../features/auth/register/register_page.dart';
import '../features/not_verified_page.dart';
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
  static const String NotVerifiedRoute = 'notVerifiedRoute';
  static const String SearchNotesRoute = 'searchNotesRoute';

  @override
  List<VRouteElement> buildRoutes() {
    return [
      VNester(
        path: null,
        widgetBuilder: (child) {
          return BlocListener<AuthenticationBloc, AuthenticationState>(
            listener: (context, state) {
              if (state.status == AuthenticationStatus.authenticated) {
                if (state.user.emailVerified) {
                  context.vRouter.pushNamed(NotesRoute);
                } else {
                  context.vRouter.pushNamed(NotVerifiedRoute);
                }
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
            beforeEnter: (vRedirector) async {
              if (await isLoggedIn()) {
                var _authRepository =
                    RepositoryProvider.of<AuthenticationRepository>(context);
                if (!_authRepository.currentUser.emailVerified) {
                  return vRedirector.pushNamed(NotVerifiedRoute);
                }
                return null;
              } else {
                return vRedirector.pushNamed(LoginRoute);
              }
            },
            stackedRoutes: [
              VWidget(
                path: '/',
                name: NotesRoute,
                widget: const NotesPage(),
                stackedRoutes: [
                  VWidget(
                    path: '/note/add',
                    name: AddNotesRoute,
                    widget: const AddNotePage(),
                  ),
                  VWidget(
                    path: '/note/search',
                    name: SearchNotesRoute,
                    widget: const SearchNotesPage(),
                  ),
                  VWidget(
                    path: '/note/:id',
                    name: NoteRoute,
                    widget: const NotePage(),
                  ),
                ],
              ),
            ],
          ),
          VGuard(
            beforeEnter: (vRedirector) async {
              if (await isLoggedIn()) {
                var _authRepository =
                    RepositoryProvider.of<AuthenticationRepository>(context);
                if (_authRepository.currentUser.emailVerified) {
                  return vRedirector.pushNamed(NotesRoute);
                }
                return null;
              } else {
                return vRedirector.pushNamed(LoginRoute);
              }
            },
            stackedRoutes: [
              VWidget(
                path: '/user/verify',
                name: NotVerifiedRoute,
                widget: const NotVerifiedPage(),
              ),
            ],
          ),
        ],
      ),
    ];
  }
}
