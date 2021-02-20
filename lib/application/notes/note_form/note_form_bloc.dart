import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:enotes/domain/notes/note.dart';
import 'package:enotes/domain/notes/note_failure.dart';
import 'package:enotes/domain/notes/note_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/collection.dart';

part 'note_form_event.dart';
part 'note_form_state.dart';
part 'note_form_bloc.freezed.dart';

@injectable
class NoteFormBloc extends Bloc<NoteFormEvent, NoteFormState> {
  NoteFormBloc({
    @required INoteRepository noteRepository,
  })  : _noteRepository = noteRepository,
        super(NoteFormState.initial());

  final INoteRepository _noteRepository;

  @override
  Stream<NoteFormState> mapEventToState(
    NoteFormEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
