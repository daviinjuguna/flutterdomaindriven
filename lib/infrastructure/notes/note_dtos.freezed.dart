// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'note_dtos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
NoteDtos _$NoteDtosFromJson(Map<String, dynamic> json) {
  return _NoteDtos.fromJson(json);
}

/// @nodoc
class _$NoteDtosTearOff {
  const _$NoteDtosTearOff();

// ignore: unused_element
  _NoteDtos call(
      {@JsonKey(ignore: true) String id,
      @required String body,
      @required int color,
      @required List<TodoItemDto> todos,
      @required @ServerTimestampConverter() FieldValue serverTimeStamp}) {
    return _NoteDtos(
      id: id,
      body: body,
      color: color,
      todos: todos,
      serverTimeStamp: serverTimeStamp,
    );
  }

// ignore: unused_element
  NoteDtos fromJson(Map<String, Object> json) {
    return NoteDtos.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $NoteDtos = _$NoteDtosTearOff();

/// @nodoc
mixin _$NoteDtos {
  @JsonKey(ignore: true)
  String get id;
  String get body;
  int get color;
  List<TodoItemDto> get todos;
  @ServerTimestampConverter()
  FieldValue get serverTimeStamp;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $NoteDtosCopyWith<NoteDtos> get copyWith;
}

/// @nodoc
abstract class $NoteDtosCopyWith<$Res> {
  factory $NoteDtosCopyWith(NoteDtos value, $Res Function(NoteDtos) then) =
      _$NoteDtosCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(ignore: true) String id,
      String body,
      int color,
      List<TodoItemDto> todos,
      @ServerTimestampConverter() FieldValue serverTimeStamp});
}

/// @nodoc
class _$NoteDtosCopyWithImpl<$Res> implements $NoteDtosCopyWith<$Res> {
  _$NoteDtosCopyWithImpl(this._value, this._then);

  final NoteDtos _value;
  // ignore: unused_field
  final $Res Function(NoteDtos) _then;

  @override
  $Res call({
    Object id = freezed,
    Object body = freezed,
    Object color = freezed,
    Object todos = freezed,
    Object serverTimeStamp = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      body: body == freezed ? _value.body : body as String,
      color: color == freezed ? _value.color : color as int,
      todos: todos == freezed ? _value.todos : todos as List<TodoItemDto>,
      serverTimeStamp: serverTimeStamp == freezed
          ? _value.serverTimeStamp
          : serverTimeStamp as FieldValue,
    ));
  }
}

/// @nodoc
abstract class _$NoteDtosCopyWith<$Res> implements $NoteDtosCopyWith<$Res> {
  factory _$NoteDtosCopyWith(_NoteDtos value, $Res Function(_NoteDtos) then) =
      __$NoteDtosCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(ignore: true) String id,
      String body,
      int color,
      List<TodoItemDto> todos,
      @ServerTimestampConverter() FieldValue serverTimeStamp});
}

/// @nodoc
class __$NoteDtosCopyWithImpl<$Res> extends _$NoteDtosCopyWithImpl<$Res>
    implements _$NoteDtosCopyWith<$Res> {
  __$NoteDtosCopyWithImpl(_NoteDtos _value, $Res Function(_NoteDtos) _then)
      : super(_value, (v) => _then(v as _NoteDtos));

  @override
  _NoteDtos get _value => super._value as _NoteDtos;

  @override
  $Res call({
    Object id = freezed,
    Object body = freezed,
    Object color = freezed,
    Object todos = freezed,
    Object serverTimeStamp = freezed,
  }) {
    return _then(_NoteDtos(
      id: id == freezed ? _value.id : id as String,
      body: body == freezed ? _value.body : body as String,
      color: color == freezed ? _value.color : color as int,
      todos: todos == freezed ? _value.todos : todos as List<TodoItemDto>,
      serverTimeStamp: serverTimeStamp == freezed
          ? _value.serverTimeStamp
          : serverTimeStamp as FieldValue,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_NoteDtos extends _NoteDtos {
  const _$_NoteDtos(
      {@JsonKey(ignore: true) this.id,
      @required this.body,
      @required this.color,
      @required this.todos,
      @required @ServerTimestampConverter() this.serverTimeStamp})
      : assert(body != null),
        assert(color != null),
        assert(todos != null),
        assert(serverTimeStamp != null),
        super._();

  factory _$_NoteDtos.fromJson(Map<String, dynamic> json) =>
      _$_$_NoteDtosFromJson(json);

  @override
  @JsonKey(ignore: true)
  final String id;
  @override
  final String body;
  @override
  final int color;
  @override
  final List<TodoItemDto> todos;
  @override
  @ServerTimestampConverter()
  final FieldValue serverTimeStamp;

  @override
  String toString() {
    return 'NoteDtos(id: $id, body: $body, color: $color, todos: $todos, serverTimeStamp: $serverTimeStamp)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _NoteDtos &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.body, body) ||
                const DeepCollectionEquality().equals(other.body, body)) &&
            (identical(other.color, color) ||
                const DeepCollectionEquality().equals(other.color, color)) &&
            (identical(other.todos, todos) ||
                const DeepCollectionEquality().equals(other.todos, todos)) &&
            (identical(other.serverTimeStamp, serverTimeStamp) ||
                const DeepCollectionEquality()
                    .equals(other.serverTimeStamp, serverTimeStamp)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(body) ^
      const DeepCollectionEquality().hash(color) ^
      const DeepCollectionEquality().hash(todos) ^
      const DeepCollectionEquality().hash(serverTimeStamp);

  @JsonKey(ignore: true)
  @override
  _$NoteDtosCopyWith<_NoteDtos> get copyWith =>
      __$NoteDtosCopyWithImpl<_NoteDtos>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_NoteDtosToJson(this);
  }
}

abstract class _NoteDtos extends NoteDtos {
  const _NoteDtos._() : super._();
  const factory _NoteDtos(
          {@JsonKey(ignore: true) String id,
          @required String body,
          @required int color,
          @required List<TodoItemDto> todos,
          @required @ServerTimestampConverter() FieldValue serverTimeStamp}) =
      _$_NoteDtos;

  factory _NoteDtos.fromJson(Map<String, dynamic> json) = _$_NoteDtos.fromJson;

  @override
  @JsonKey(ignore: true)
  String get id;
  @override
  String get body;
  @override
  int get color;
  @override
  List<TodoItemDto> get todos;
  @override
  @ServerTimestampConverter()
  FieldValue get serverTimeStamp;
  @override
  @JsonKey(ignore: true)
  _$NoteDtosCopyWith<_NoteDtos> get copyWith;
}

TodoItemDto _$TodoItemDtoFromJson(Map<String, dynamic> json) {
  return _TodoItemDto.fromJson(json);
}

/// @nodoc
class _$TodoItemDtoTearOff {
  const _$TodoItemDtoTearOff();

// ignore: unused_element
  _TodoItemDto call(
      {@required String todoId, @required String name, @required bool done}) {
    return _TodoItemDto(
      todoId: todoId,
      name: name,
      done: done,
    );
  }

// ignore: unused_element
  TodoItemDto fromJson(Map<String, Object> json) {
    return TodoItemDto.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $TodoItemDto = _$TodoItemDtoTearOff();

/// @nodoc
mixin _$TodoItemDto {
  String get todoId;
  String get name;
  bool get done;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $TodoItemDtoCopyWith<TodoItemDto> get copyWith;
}

/// @nodoc
abstract class $TodoItemDtoCopyWith<$Res> {
  factory $TodoItemDtoCopyWith(
          TodoItemDto value, $Res Function(TodoItemDto) then) =
      _$TodoItemDtoCopyWithImpl<$Res>;
  $Res call({String todoId, String name, bool done});
}

/// @nodoc
class _$TodoItemDtoCopyWithImpl<$Res> implements $TodoItemDtoCopyWith<$Res> {
  _$TodoItemDtoCopyWithImpl(this._value, this._then);

  final TodoItemDto _value;
  // ignore: unused_field
  final $Res Function(TodoItemDto) _then;

  @override
  $Res call({
    Object todoId = freezed,
    Object name = freezed,
    Object done = freezed,
  }) {
    return _then(_value.copyWith(
      todoId: todoId == freezed ? _value.todoId : todoId as String,
      name: name == freezed ? _value.name : name as String,
      done: done == freezed ? _value.done : done as bool,
    ));
  }
}

/// @nodoc
abstract class _$TodoItemDtoCopyWith<$Res>
    implements $TodoItemDtoCopyWith<$Res> {
  factory _$TodoItemDtoCopyWith(
          _TodoItemDto value, $Res Function(_TodoItemDto) then) =
      __$TodoItemDtoCopyWithImpl<$Res>;
  @override
  $Res call({String todoId, String name, bool done});
}

/// @nodoc
class __$TodoItemDtoCopyWithImpl<$Res> extends _$TodoItemDtoCopyWithImpl<$Res>
    implements _$TodoItemDtoCopyWith<$Res> {
  __$TodoItemDtoCopyWithImpl(
      _TodoItemDto _value, $Res Function(_TodoItemDto) _then)
      : super(_value, (v) => _then(v as _TodoItemDto));

  @override
  _TodoItemDto get _value => super._value as _TodoItemDto;

  @override
  $Res call({
    Object todoId = freezed,
    Object name = freezed,
    Object done = freezed,
  }) {
    return _then(_TodoItemDto(
      todoId: todoId == freezed ? _value.todoId : todoId as String,
      name: name == freezed ? _value.name : name as String,
      done: done == freezed ? _value.done : done as bool,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_TodoItemDto extends _TodoItemDto {
  const _$_TodoItemDto(
      {@required this.todoId, @required this.name, @required this.done})
      : assert(todoId != null),
        assert(name != null),
        assert(done != null),
        super._();

  factory _$_TodoItemDto.fromJson(Map<String, dynamic> json) =>
      _$_$_TodoItemDtoFromJson(json);

  @override
  final String todoId;
  @override
  final String name;
  @override
  final bool done;

  @override
  String toString() {
    return 'TodoItemDto(todoId: $todoId, name: $name, done: $done)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TodoItemDto &&
            (identical(other.todoId, todoId) ||
                const DeepCollectionEquality().equals(other.todoId, todoId)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.done, done) ||
                const DeepCollectionEquality().equals(other.done, done)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(todoId) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(done);

  @JsonKey(ignore: true)
  @override
  _$TodoItemDtoCopyWith<_TodoItemDto> get copyWith =>
      __$TodoItemDtoCopyWithImpl<_TodoItemDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_TodoItemDtoToJson(this);
  }
}

abstract class _TodoItemDto extends TodoItemDto {
  const _TodoItemDto._() : super._();
  const factory _TodoItemDto(
      {@required String todoId,
      @required String name,
      @required bool done}) = _$_TodoItemDto;

  factory _TodoItemDto.fromJson(Map<String, dynamic> json) =
      _$_TodoItemDto.fromJson;

  @override
  String get todoId;
  @override
  String get name;
  @override
  bool get done;
  @override
  @JsonKey(ignore: true)
  _$TodoItemDtoCopyWith<_TodoItemDto> get copyWith;
}
