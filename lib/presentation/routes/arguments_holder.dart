import 'package:enotes/domain/notes/note.dart';

class NoteFormArguments {
  final Note? editedNote;

  NoteFormArguments({
    this.editedNote,
  });

  NoteFormArguments copyWith({
    Note? editedNote,
  }) {
    return NoteFormArguments(
      editedNote: editedNote ?? this.editedNote,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is NoteFormArguments && other.editedNote == editedNote;
  }

  @override
  int get hashCode => editedNote.hashCode;

  @override
  String toString() => 'NoteFormArguments(editedNote: $editedNote)';
}
