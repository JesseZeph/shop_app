// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'general.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GeneralModel _$GeneralModelFromJson(Map<String, dynamic> json) {
  return _GeneralModel.fromJson(json);
}

/// @nodoc
mixin _$GeneralModel {
  bool? get success => throw _privateConstructorUsedError;
  int? get statusCode => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  List<StoreProduct> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GeneralModelCopyWith<GeneralModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeneralModelCopyWith<$Res> {
  factory $GeneralModelCopyWith(
          GeneralModel value, $Res Function(GeneralModel) then) =
      _$GeneralModelCopyWithImpl<$Res, GeneralModel>;
  @useResult
  $Res call(
      {bool? success, int? statusCode, String? message, List<StoreProduct> data});
}

/// @nodoc
class _$GeneralModelCopyWithImpl<$Res, $Val extends GeneralModel>
    implements $GeneralModelCopyWith<$Res> {
  _$GeneralModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = freezed,
    Object? statusCode = freezed,
    Object? message = freezed,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      success: freezed == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool?,
      statusCode: freezed == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<StoreProduct>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GeneralModelImplCopyWith<$Res>
    implements $GeneralModelCopyWith<$Res> {
  factory _$$GeneralModelImplCopyWith(
          _$GeneralModelImpl value, $Res Function(_$GeneralModelImpl) then) =
      __$$GeneralModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool? success, int? statusCode, String? message, List<StoreProduct> data});
}

/// @nodoc
class __$$GeneralModelImplCopyWithImpl<$Res>
    extends _$GeneralModelCopyWithImpl<$Res, _$GeneralModelImpl>
    implements _$$GeneralModelImplCopyWith<$Res> {
  __$$GeneralModelImplCopyWithImpl(
      _$GeneralModelImpl _value, $Res Function(_$GeneralModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = freezed,
    Object? statusCode = freezed,
    Object? message = freezed,
    Object? data = null,
  }) {
    return _then(_$GeneralModelImpl(
      success: freezed == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool?,
      statusCode: freezed == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<StoreProduct>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GeneralModelImpl with DiagnosticableTreeMixin implements _GeneralModel {
  const _$GeneralModelImpl(
      {required this.success,
      required this.statusCode,
      required this.message,
      required final List<StoreProduct> data})
      : _data = data;

  factory _$GeneralModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$GeneralModelImplFromJson(json);

  @override
  final bool? success;
  @override
  final int? statusCode;
  @override
  final String? message;
  final List<StoreProduct> _data;
  @override
  List<StoreProduct> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GeneralModel(success: $success, statusCode: $statusCode, message: $message, data: $data)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'GeneralModel'))
      ..add(DiagnosticsProperty('success', success))
      ..add(DiagnosticsProperty('statusCode', statusCode))
      ..add(DiagnosticsProperty('message', message))
      ..add(DiagnosticsProperty('data', data));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GeneralModelImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, success, statusCode, message,
      const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GeneralModelImplCopyWith<_$GeneralModelImpl> get copyWith =>
      __$$GeneralModelImplCopyWithImpl<_$GeneralModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GeneralModelImplToJson(
      this,
    );
  }
}

abstract class _GeneralModel implements GeneralModel {
  const factory _GeneralModel(
      {required final bool? success,
      required final int? statusCode,
      required final String? message,
      required final List<StoreProduct> data}) = _$GeneralModelImpl;

  factory _GeneralModel.fromJson(Map<String, dynamic> json) =
      _$GeneralModelImpl.fromJson;

  @override
  bool? get success;
  @override
  int? get statusCode;
  @override
  String? get message;
  @override
  List<StoreProduct> get data;
  @override
  @JsonKey(ignore: true)
  _$$GeneralModelImplCopyWith<_$GeneralModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
