// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i4;
import 'package:firebase_auth/firebase_auth.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i5;
import 'package:injectable/injectable.dart' as _i2;
import 'package:nota/application/auth/auth_bloc.dart' as _i13;
import 'package:nota/application/auth/login/login_bloc.dart' as _i10;
import 'package:nota/application/auth/register/register_bloc.dart' as _i12;
import 'package:nota/application/notes/notes_watch/notes_watch_bloc.dart'
    as _i11;
import 'package:nota/domain/auth/i_auth_facade.dart' as _i6;
import 'package:nota/domain/notes/i_note_repository.dart' as _i8;
import 'package:nota/infrastructure/auth/firebase_auth_facade.dart' as _i7;
import 'package:nota/infrastructure/core/firebase_injectable_module.dart'
    as _i14;
import 'package:nota/infrastructure/notes/note_repository.dart'
    as _i9; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final firebaseInjectableModule = _$FirebaseInjectableModule();
    gh.lazySingleton<_i3.FirebaseAuth>(
        () => firebaseInjectableModule.firebaseAuth);
    gh.lazySingleton<_i4.FirebaseFirestore>(
        () => firebaseInjectableModule.firebaseFirestore);
    gh.lazySingleton<_i5.GoogleSignIn>(
        () => firebaseInjectableModule.googleSignIn);
    gh.lazySingleton<_i6.IAuthFacade>(() => _i7.FirebaseAuthFacade(
          gh<_i3.FirebaseAuth>(),
          gh<_i5.GoogleSignIn>(),
          gh<_i4.FirebaseFirestore>(),
        ));
    gh.lazySingleton<_i8.INoteRepository>(
        () => _i9.NoteRepository(gh<_i4.FirebaseFirestore>()));
    gh.factory<_i10.LoginBloc>(() => _i10.LoginBloc(gh<_i6.IAuthFacade>()));
    gh.singleton<_i11.NotesWatchBloc>(
        _i11.NotesWatchBloc(gh<_i8.INoteRepository>()));
    gh.factory<_i12.RegisterBloc>(
        () => _i12.RegisterBloc(gh<_i6.IAuthFacade>()));
    gh.factory<_i13.AuthBloc>(
        () => _i13.AuthBloc(authRepository: gh<_i6.IAuthFacade>()));
    return this;
  }
}

class _$FirebaseInjectableModule extends _i14.FirebaseInjectableModule {}
