import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:nota/presentation/pages/auth/login/login_page.dart';
import 'package:nota/presentation/pages/main/notes/notes_page.dart';
import 'package:nota/presentation/pages/not_found_page.dart';

class AppRouter {
  static GoRouter get router => GoRouter(
        debugLogDiagnostics: kDebugMode,
        routes: [
          GoRoute(
            path: '/',
            builder: (context, state) => const NotesPage(),
          ),
          GoRoute(
            path: '/login',
            builder: (context, state) => const LoginPage(),
          ),
        ],
        errorBuilder: (context, state) => const NotFoundPage(),
      );
}
