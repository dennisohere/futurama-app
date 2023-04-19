// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'show.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Show _$ShowFromJson(Map<String, dynamic> json) {
  return _Show.fromJson(json);
}

/// @nodoc
mixin _$Show {
  String get yearsAired => throw _privateConstructorUsedError;
  String get synopsis => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  List<Creator> get creators => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShowCopyWith<Show> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShowCopyWith<$Res> {
  factory $ShowCopyWith(Show value, $Res Function(Show) then) =
      _$ShowCopyWithImpl<$Res, Show>;
  @useResult
  $Res call(
      {String yearsAired, String synopsis, int id, List<Creator> creators});
}

/// @nodoc
class _$ShowCopyWithImpl<$Res, $Val extends Show>
    implements $ShowCopyWith<$Res> {
  _$ShowCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? yearsAired = null,
    Object? synopsis = null,
    Object? id = null,
    Object? creators = null,
  }) {
    return _then(_value.copyWith(
      yearsAired: null == yearsAired
          ? _value.yearsAired
          : yearsAired // ignore: cast_nullable_to_non_nullable
              as String,
      synopsis: null == synopsis
          ? _value.synopsis
          : synopsis // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      creators: null == creators
          ? _value.creators
          : creators // ignore: cast_nullable_to_non_nullable
              as List<Creator>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ShowCopyWith<$Res> implements $ShowCopyWith<$Res> {
  factory _$$_ShowCopyWith(_$_Show value, $Res Function(_$_Show) then) =
      __$$_ShowCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String yearsAired, String synopsis, int id, List<Creator> creators});
}

/// @nodoc
class __$$_ShowCopyWithImpl<$Res> extends _$ShowCopyWithImpl<$Res, _$_Show>
    implements _$$_ShowCopyWith<$Res> {
  __$$_ShowCopyWithImpl(_$_Show _value, $Res Function(_$_Show) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? yearsAired = null,
    Object? synopsis = null,
    Object? id = null,
    Object? creators = null,
  }) {
    return _then(_$_Show(
      yearsAired: null == yearsAired
          ? _value.yearsAired
          : yearsAired // ignore: cast_nullable_to_non_nullable
              as String,
      synopsis: null == synopsis
          ? _value.synopsis
          : synopsis // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      creators: null == creators
          ? _value._creators
          : creators // ignore: cast_nullable_to_non_nullable
              as List<Creator>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Show extends _Show with DiagnosticableTreeMixin {
  const _$_Show(
      {required this.yearsAired,
      required this.synopsis,
      required this.id,
      final List<Creator> creators = const []})
      : _creators = creators,
        super._();

  factory _$_Show.fromJson(Map<String, dynamic> json) => _$$_ShowFromJson(json);

  @override
  final String yearsAired;
  @override
  final String synopsis;
  @override
  final int id;
  final List<Creator> _creators;
  @override
  @JsonKey()
  List<Creator> get creators {
    if (_creators is EqualUnmodifiableListView) return _creators;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_creators);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Show(yearsAired: $yearsAired, synopsis: $synopsis, id: $id, creators: $creators)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Show'))
      ..add(DiagnosticsProperty('yearsAired', yearsAired))
      ..add(DiagnosticsProperty('synopsis', synopsis))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('creators', creators));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Show &&
            (identical(other.yearsAired, yearsAired) ||
                other.yearsAired == yearsAired) &&
            (identical(other.synopsis, synopsis) ||
                other.synopsis == synopsis) &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._creators, _creators));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, yearsAired, synopsis, id,
      const DeepCollectionEquality().hash(_creators));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ShowCopyWith<_$_Show> get copyWith =>
      __$$_ShowCopyWithImpl<_$_Show>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ShowToJson(
      this,
    );
  }
}

abstract class _Show extends Show {
  const factory _Show(
      {required final String yearsAired,
      required final String synopsis,
      required final int id,
      final List<Creator> creators}) = _$_Show;
  const _Show._() : super._();

  factory _Show.fromJson(Map<String, dynamic> json) = _$_Show.fromJson;

  @override
  String get yearsAired;
  @override
  String get synopsis;
  @override
  int get id;
  @override
  List<Creator> get creators;
  @override
  @JsonKey(ignore: true)
  _$$_ShowCopyWith<_$_Show> get copyWith => throw _privateConstructorUsedError;
}
