import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:enotes/domain/core/value_object.dart';
import 'package:enotes/domain/notes/note.dart';
import 'package:enotes/domain/notes/note_value_object.dart';
import 'package:enotes/domain/notes/todo_item.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/kt.dart';

part 'note_dtos.freezed.dart';
part 'note_dtos.g.dart';

@freezed
abstract class NoteDtos implements _$NoteDtos {
  const factory NoteDtos({
    @JsonKey(ignore: true) String id,
    @required String body,
    @required int color,
    @required List<TodoItemDto> todos,
    @required @ServerTimestampConverter() FieldValue serverTimeStamp,
  }) = _NoteDtos;

  const NoteDtos._();

  factory NoteDtos.fromDomain(Note note) => NoteDtos(
        id: note.id.getOrCrash(),
        body: note.body.getOrCrash(),
        color: note.color.getOrCrash().value,
        todos: note.todos
            .getOrCrash()
            .map(
              (todoItem) => TodoItemDto.fromDomain(todoItem),
            )
            .asList(),
        serverTimeStamp: FieldValue.serverTimestamp(),
      );
      
  Note toDomain() {
    return Note(
      id: UniqueId.fromUniqueString(id),
      body: NoteBody(body),
      color: NoteColor(Color(color)),
      todos: List3(todos.map((e) => e.toDomain()).toImmutableList()),
    );
  }

  factory NoteDtos.fromJson(Map<String, dynamic> json) =>
      _$NoteDtosFromJson(json);

  factory NoteDtos.fromFirestore(DocumentSnapshot doc) =>
      NoteDtos.fromJson(doc.data()).copyWith(id: doc.id);
}

//Custom converter
class ServerTimestampConverter implements JsonConverter<FieldValue, Object> {
  const ServerTimestampConverter();

  @override
  FieldValue fromJson(Object json) {
    return FieldValue.serverTimestamp();
  }

  @override
  Object toJson(FieldValue fieldValue) => fieldValue;
}

@freezed
abstract class TodoItemDto implements _$TodoItemDto {
  const factory TodoItemDto({
    @required String todoId,
    @required String name,
    @required bool done,
  }) = _TodoItemDto;

  const TodoItemDto._();

  factory TodoItemDto.fromDomain(TodoItem todoItem) {
    return TodoItemDto(
      todoId: todoItem.id.getOrCrash(),
      name: todoItem.name.getOrCrash(),
      done: todoItem.done,
    );
  }

  factory TodoItemDto.fromJson(Map<String, dynamic> json) =>
      _$TodoItemDtoFromJson(json);

  TodoItem toDomain() {
    return TodoItem(
      id: UniqueId.fromUniqueString(todoId),
      name: TodoName(name),
      done: done,
    );
  }
}
