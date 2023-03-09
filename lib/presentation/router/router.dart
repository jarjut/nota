import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nota/application/auth/auth_bloc.dart';
import 'package:nota/presentation/pages/auth/login/login_page.dart';
import 'package:nota/presentation/pages/auth/register/register_page.dart';
import 'package:nota/presentation/pages/auth/verify/verify_page.dart';
import 'package:nota/presentation/pages/main/note/note_page.dart';
import 'package:nota/presentation/pages/main/notes/notes_page.dart';
import 'package:nota/presentation/pages/not_found_page.dart';

class AppRouter {
  static GoRouter router(BuildContext context) {
    return GoRouter(
      debugLogDiagnostics: kDebugMode,
      routes: [
        GoRoute(
          path: '/',
          redirect: (context, state) => '/notes',
        ),
        GoRoute(
          path: '/login',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: LoginPage()),
        ),
        GoRoute(
          path: '/register',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: RegisterPage()),
        ),
        GoRoute(
          path: '/verify',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: VerifyPage()),
        ),
        GoRoute(
          path: '/notes',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: NotesPage()),
        ),
        GoRoute(
          path: '/archive',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: NotesPage(type: NotesPageType.archive),
          ),
        ),
        GoRoute(
          path: '/trash',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: NotesPage(type: NotesPageType.trash),
          ),
        ),
        GoRoute(
          path: '/note',
          pageBuilder: (context, state) {
            final noteId = state.queryParams['id'];
            final notePage = NotePage(noteId: noteId);
            // final width = window.physicalSize.width / window.devicePixelRatio;
            // final isDesktop = width > kDesktopBreakpoint;
            // if (isDesktop) {
            //   return DialogPage(key: state.pageKey, child: notePage);
            // }
            return NoTransitionPage(key: state.pageKey, child: notePage);
          },
        ),
      ],
      errorBuilder: (context, state) => const NotFoundPage(),
      refreshListenable: GoRouterRefreshStream(context.read<AuthBloc>().stream),
      redirect: (context, state) async {
        final authBloc = context.read<AuthBloc>();
        final user = authBloc.state.user;

        final subloc = state.subloc;
        const loginPath = '/login';
        const registerPath = '/register';
        const verifyPath = '/verify';
        const homePath = '/notes';

        final isOnAuthPage = subloc == loginPath || subloc == registerPath;
        final isOnVerifyPage = subloc == verifyPath;

        /// If the user is already logged in, redirect to the main page.
        if (isOnAuthPage && user.isNotEmpty) return homePath;

        /// If the user is on the verify page and has already verified
        /// their email, redirect to the main page.
        if (isOnVerifyPage) {
          if (user.isEmpty) return loginPath;
          if (user.emailVerified) return homePath;
        }

        /// If user not logged in, redirect to login page.
        /// If user not verified, redirect to verify page.
        if (!isOnAuthPage) {
          if (user.isEmpty) return loginPath;
          if (!user.emailVerified) return verifyPath;
        }

        return null;
      },
    );
  }
}

class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen(
          (dynamic _) => notifyListeners(),
        );
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
