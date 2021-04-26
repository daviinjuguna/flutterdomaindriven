import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'application/auth/auth_bloc.dart';
import 'application/language/language_bloc.dart';
import 'application/notes/note_actor/note_actor_bloc.dart';
import 'application/notes/note_form/note_form_bloc.dart';
import 'application/notes/note_watcher/note_watcher_bloc.dart';
import 'application/sign_in/sign_in_bloc.dart';
import 'domain/auth/auth_facades.dart';
import 'domain/lang/language_facade.dart';
import 'domain/notes/note_repository.dart';
import 'infrastructure/auth/firebase_auth_facade.dart';
import 'infrastructure/core/firebase_injectable_module.dart';
import 'infrastructure/lang/language_facade_impl.dart';
import 'infrastructure/notes/note_repository.dart';

final GetIt getIt = GetIt.instance;

Future<void> configureInjection() async {
  // final get = Get
  final firebaseInjectableModule = _Module();
  final resolvedSharedPreferences = await firebaseInjectableModule.prefs;

  //modules third parties
  getIt.registerFactory<SharedPreferences>(() => resolvedSharedPreferences);
  getIt.registerLazySingleton<GoogleSignIn>(
      () => firebaseInjectableModule.googleSignIn);
  getIt.registerLazySingleton<FirebaseAuth>(
      () => firebaseInjectableModule.firebaseAuth);
  getIt.registerLazySingleton<FirebaseFirestore>(
      () => firebaseInjectableModule.firestore);

  getIt.registerLazySingleton<INoteRepository>(
      () => NoteRepository(firestore: getIt.get<FirebaseFirestore>()));

  //bloc
  getIt.registerFactory<NoteActorBloc>(
      () => NoteActorBloc(noteRepository: getIt.get<INoteRepository>()));
  getIt.registerFactory<NoteFormBloc>(
      () => NoteFormBloc(noteRepository: getIt.get<INoteRepository>()));
  getIt.registerFactory<NoteWatcherBloc>(
      () => NoteWatcherBloc(noteRepository: getIt.get<INoteRepository>()));
  getIt.registerFactory<SignInBloc>(
      () => SignInBloc(facade: getIt.get<AuthFacade>()));
  getIt.registerFactory<AuthBloc>(
      () => AuthBloc(facade: getIt.get<AuthFacade>()));
  getIt.registerFactory<LanguageBloc>(
      () => LanguageBloc(facade: getIt.get<LanguageFacade>()));

  getIt.registerLazySingleton<AuthFacade>(() => FirebaseAuthFacade(
      firebaseAuth: getIt.get<FirebaseAuth>(),
      googleSignIn: getIt.get<GoogleSignIn>()));
  getIt.registerLazySingleton<LanguageFacade>(
      () => LanguageFacadeImpl(prefs: getIt.get<SharedPreferences>()));
}

class _Module extends FirebaseInjectableModule {}
