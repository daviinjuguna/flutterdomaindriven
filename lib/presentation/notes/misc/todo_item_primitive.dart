import 'package:enotes/domain/core/value_object.dart';
import 'package:enotes/domain/notes/note_value_object.dart';
import 'package:enotes/domain/notes/todo_item.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/kt.dart';
import 'package:provider/provider.dart';

part 'todo_item_primitive.freezed.dart';

@freezed
class TodoItemPrimitive with _$TodoItemPrimitive {
  factory TodoItemPrimitive({
    required UniqueId id,
    required String name,
    required bool done,
  }) = _TodoItemPrimitive;

  const TodoItemPrimitive._();

  factory TodoItemPrimitive.empty() => TodoItemPrimitive(
        id: UniqueId(),
        name: "",
        done: false,
      );

  factory TodoItemPrimitive.fromDomain(TodoItem item) => TodoItemPrimitive(
        id: item.id,
        name: item.name.getOrCrash(),
        done: item.done,
      );

  TodoItem toDomain() => TodoItem(
        id: id,
        name: TodoName(name),
        done: done,
      );
}

class FormTodos extends ValueNotifier<KtList<TodoItemPrimitive>> {
  FormTodos() : super(emptyList<TodoItemPrimitive>());
}

extension FormTodosX on BuildContext {
  KtList<TodoItemPrimitive> get formTodos =>
      Provider.of<FormTodos>(this, listen: false).value;
  set formTodos(KtList<TodoItemPrimitive> value) =>
      Provider.of<FormTodos>(this, listen: false).value = value;
}
