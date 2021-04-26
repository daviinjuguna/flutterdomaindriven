import 'package:dartz/dartz.dart';
import 'package:enotes/domain/auth/auth_failure.dart';
import 'package:enotes/domain/auth/inputs.dart';
import 'package:enotes/domain/auth/user.dart';

abstract class AuthFacade {
  Future<Option<User>> getSignedInUser();
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword({
    required EmailAddress emailAddress,
    required Password password,
    // @required Name name,
  });
  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword({
    required EmailAddress emailAddress,
    required Password password,
  });
  Future<Either<AuthFailure, Unit>> signInWithGoogle();
  Future<void> signOut();
}
