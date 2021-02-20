// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'application/auth/auth_bloc.dart';
import 'domain/auth/auth_facades.dart';
import 'infrastructure/auth/firebase_auth_facade.dart';
import 'infrastructure/core/firebase_injectable_module.dart';
import 'domain/notes/note_repository.dart';
import 'application/language/language_bloc.dart';
import 'domain/lang/language_facade.dart';
import 'infrastructure/lang/language_facade_impl.dart';
import 'application/notes/note_actor/note_actor_bloc.dart';
import 'application/notes/note_form/note_form_bloc.dart';
import 'infrastructure/notes/note_repository.dart';
import 'application/notes/note_watcher/note_watcher_bloc.dart';
import 'application/sign_in/sign_in_bloc.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

Future<GetIt> $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) async {
  final gh = GetItHelper(get, environment, environmentFilter);
  final firebaseInjectableModule = _$FirebaseInjectableModule();
  gh.lazySingleton<FirebaseAuth>(() => firebaseInjectableModule.firebaseAuth);
  gh.lazySingleton<FirebaseFirestore>(() => firebaseInjectableModule.firestore);
  gh.lazySingleton<GoogleSignIn>(() => firebaseInjectableModule.googleSignIn);
  gh.lazySingleton<INoteRepository>(
      () => NoteRepository(firestore: get<FirebaseFirestore>()));
  gh.factory<NoteActorBloc>(
      () => NoteActorBloc(noteRepository: get<INoteRepository>()));
  gh.factory<NoteFormBloc>(
      () => NoteFormBloc(noteRepository: get<INoteRepository>()));
  gh.factory<NoteWatcherBloc>(
      () => NoteWatcherBloc(noteRepository: get<INoteRepository>()));
  final resolvedSharedPreferences = await firebaseInjectableModule.prefs;
  gh.factory<SharedPreferences>(() => resolvedSharedPreferences);
  gh.lazySingleton<AuthFacade>(() => FirebaseAuthFacade(
      firebaseAuth: get<FirebaseAuth>(), googleSignIn: get<GoogleSignIn>()));
  gh.lazySingleton<LanguageFacade>(
      () => LanguageFacadeImpl(prefs: get<SharedPreferences>()));
  gh.factory<SignInBloc>(() => SignInBloc(facade: get<AuthFacade>()));
  gh.factory<AuthBloc>(() => AuthBloc(facade: get<AuthFacade>()));
  gh.factory<LanguageBloc>(() => LanguageBloc(facade: get<LanguageFacade>()));
  return get;
}

class _$FirebaseInjectableModule extends FirebaseInjectableModule {}
