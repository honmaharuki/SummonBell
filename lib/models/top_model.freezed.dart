// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'top_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TopModel _$TopModelFromJson(Map<String, dynamic> json) {
  return _TopModel.fromJson(json);
}

/// @nodoc
mixin _$TopModel {
  int get aId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TopModelCopyWith<TopModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TopModelCopyWith<$Res> {
  factory $TopModelCopyWith(TopModel value, $Res Function(TopModel) then) =
      _$TopModelCopyWithImpl<$Res, TopModel>;
  @useResult
  $Res call({int aId});
}

/// @nodoc
class _$TopModelCopyWithImpl<$Res, $Val extends TopModel>
    implements $TopModelCopyWith<$Res> {
  _$TopModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? aId = null,
  }) {
    return _then(_value.copyWith(
      aId: null == aId
          ? _value.aId
          : aId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TopModelImplCopyWith<$Res>
    implements $TopModelCopyWith<$Res> {
  factory _$$TopModelImplCopyWith(
          _$TopModelImpl value, $Res Function(_$TopModelImpl) then) =
      __$$TopModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int aId});
}

/// @nodoc
class __$$TopModelImplCopyWithImpl<$Res>
    extends _$TopModelCopyWithImpl<$Res, _$TopModelImpl>
    implements _$$TopModelImplCopyWith<$Res> {
  __$$TopModelImplCopyWithImpl(
      _$TopModelImpl _value, $Res Function(_$TopModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? aId = null,
  }) {
    return _then(_$TopModelImpl(
      aId: null == aId
          ? _value.aId
          : aId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TopModelImpl extends _TopModel {
  const _$TopModelImpl({required this.aId}) : super._();

  factory _$TopModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TopModelImplFromJson(json);

  @override
  final int aId;

  @override
  String toString() {
    return 'TopModel(aId: $aId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TopModelImpl &&
            (identical(other.aId, aId) || other.aId == aId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, aId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TopModelImplCopyWith<_$TopModelImpl> get copyWith =>
      __$$TopModelImplCopyWithImpl<_$TopModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TopModelImplToJson(
      this,
    );
  }
}

abstract class _TopModel extends TopModel {
  const factory _TopModel({required final int aId}) = _$TopModelImpl;
  const _TopModel._() : super._();

  factory _TopModel.fromJson(Map<String, dynamic> json) =
      _$TopModelImpl.fromJson;

  @override
  int get aId;
  @override
  @JsonKey(ignore: true)
  _$$TopModelImplCopyWith<_$TopModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
