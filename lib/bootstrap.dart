import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:nota/application/auth/auth_bloc.dart';
import 'package:nota/application/notes/notes_watch/notes_watch_bloc.dart';
import 'package:nota/application/theme/theme_cubit.dart';
import 'package:nota/injection.dart';
import 'package:path_provider/path_provider.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc<dynamic, dynamic> bloc, Object? event) {
    log(
      'onEvent(${bloc.runtimeType}, $event)',
      name: 'BlocObserver',
    );
    super.onEvent(bloc, event);
  }

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    log(
      'onChange(${bloc.runtimeType}, $change)',
      name: 'BlocObserver',
    );
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    log(
      'onError(${bloc.runtimeType})',
      error: error.toString(),
      stackTrace: stackTrace,
      name: 'BlocObserver',
    );
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  FlutterError.onError = (details) {
    log(
      details.exceptionAsString(),
      stackTrace: details.stack,
      name: 'FlutterError',
    );
  };

  Bloc.observer = AppBlocObserver();

  // Hydrated Bloc Setup
  Directory storageDirectory;
  if (kIsWeb) {
    storageDirectory = HydratedStorage.webStorageDirectory;
  } else {
    storageDirectory = await getApplicationDocumentsDirectory();
  }
  HydratedBloc.storage =
      await HydratedStorage.build(storageDirectory: storageDirectory);

  await runZonedGuarded(
    () async {
      final widget = await builder();

      runApp(
        MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => getIt<AuthBloc>(),
            ),
            BlocProvider(
              create: (context) => getIt<NotesWatchBloc>(),
            ),
            BlocProvider(
              create: (context) => getIt<ThemeCubit>(),
            ),
          ],
          child: widget,
        ),
      );
    },
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}
