import 'package:dartz/dartz.dart';
import 'package:enotes/domain/core/value_failure.dart';
import 'package:enotes/domain/core/value_object.dart';
import 'package:enotes/domain/core/value_validators.dart';

class EmailAddress extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory EmailAddress(String input) {
    assert(input != null);
    return EmailAddress._(
      validateEmailAddress(input),
    );
  }

  const EmailAddress._(this.value);
}

class Password extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory Password(String input) {
    assert(input != null);
    return Password._(
      validatePassword(input),
    );
  }

  const Password._(this.value);
}

class Name extends ValueObject<String>{

  @override
  final Either<ValueFailure<String>, String> value;
  
  factory Name(String input) {
    assert(input != null);
    return Name._(
      validateName(input),
    );
  }

  const Name._(this.value);
}