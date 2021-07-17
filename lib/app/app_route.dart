import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vrouter/vrouter.dart';

import '../features/auth/login/login_page.dart';
import '../features/auth/register/register_page.dart';
import '../features/main/notes/pages/add_note_page.dart';
import '../features/main/notes/pages/archive_page.dart';
import '../features/main/notes/pages/note_page.dart';
import '../features/main/notes/pages/notes_page.dart';
import '../features/main/notes/pages/trash_page.dart';
import '../features/main/search_notes/search_notes_page.dart';
import '../features/not_found_page.dart';
import '../features/not_verified/not_verified_page.dart';
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
  static const String SearchedNoteRoute = 'searchedNoteRoute';
  static const String ArchiveRoute = 'archiveRoute';
  static const String TrashRoute = 'trashRoute';

  Widget AppSlideRightTransition(
    Animation<double> animation,
    Animation<double> secondAnimation,
    Widget child,
  ) {
    var begin = const Offset(-1, 0);
    var end = Offset.zero;
    var curve = Curves.easeInOut;
    var tween = Tween(begin: begin, end: end);
    var curvedAnimation = CurvedAnimation(
      parent: animation,
      curve: curve,
    );

    return SlideTransition(
      position: tween.animate(curvedAnimation),
      child: child,
    );
  }

  bool platformIsMobile() {
    if (!kIsWeb) {
      return Platform.isAndroid || Platform.isIOS;
    } else {
      return false;
    }
  }

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
                  context.vRouter.toNamed(NotesRoute);
                } else {
                  context.vRouter.toNamed(NotVerifiedRoute);
                }
              }
              if (state.status == AuthenticationStatus.unauthenticated) {
                context.vRouter.toNamed(LoginRoute);
              }
            },
            child: child,
          );
        },
        nestedRoutes: [
          VGuard(
            beforeEnter: (vRedirector) async =>
                await isLoggedIn() ? vRedirector.toNamed(NotesRoute) : null,
            stackedRoutes: [
              VPopHandler(
                onPop: (vRedirector) async {
                  if (vRedirector.historyCanBack()) {
                    vRedirector.historyBack();
                  } else {
                    vRedirector.pop();
                  }
                },
                stackedRoutes: [
                  VWidget(
                    path: '/login',
                    name: LoginRoute,
                    buildTransition: (animation1, _, child) => FadeTransition(
                      opacity: animation1,
                      child: child,
                    ),
                    transitionDuration: const Duration(milliseconds: 400),
                    widget: const LoginPage(),
                  ),
                  VWidget(
                    path: '/register',
                    name: RegisterRoute,
                    buildTransition: (animation1, _, child) => FadeTransition(
                      opacity: animation1,
                      child: child,
                    ),
                    transitionDuration: const Duration(milliseconds: 400),
                    widget: const RegisterPage(),
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
                if (!_authRepository.currentUser.emailVerified) {
                  return vRedirector.toNamed(NotVerifiedRoute);
                }
                return null;
              } else {
                return vRedirector.toNamed(LoginRoute);
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
                    path: '/search',
                    name: SearchNotesRoute,
                    widget: const SearchNotesPage(),
                    stackedRoutes: [
                      VWidget(
                        path: ':id',
                        name: SearchedNoteRoute,
                        buildTransition:
                            platformIsMobile() ? AppSlideRightTransition : null,
                        widget: const NotePage(),
                      ),
                    ],
                  ),
                  VWidget(
                    path: '/archive',
                    name: ArchiveRoute,
                    widget: const ArchivePage(),
                  ),
                  VWidget(
                    path: '/trash',
                    name: TrashRoute,
                    widget: const TrashPage(),
                  ),
                  VWidget(
                    path: '/note/:id',
                    name: NoteRoute,
                    buildTransition:
                        platformIsMobile() ? AppSlideRightTransition : null,
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
                  return vRedirector.toNamed(NotesRoute);
                }
                return null;
              } else {
                return vRedirector.toNamed(LoginRoute);
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
      VWidget(path: '/404', widget: const NotFoundPage()),
      VRouteRedirector(
        path: r':_(.+)',
        redirectTo: '/404',
      ),
    ];
  }
}
