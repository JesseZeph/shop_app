// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'general_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GeneralUser _$GeneralUserFromJson(Map<String, dynamic> json) {
  return _GeneralUser.fromJson(json);
}

/// @nodoc
mixin _$GeneralUser {
  bool? get success => throw _privateConstructorUsedError;
  int? get statusCode => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  User get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GeneralUserCopyWith<GeneralUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeneralUserCopyWith<$Res> {
  factory $GeneralUserCopyWith(
          GeneralUser value, $Res Function(GeneralUser) then) =
      _$GeneralUserCopyWithImpl<$Res, GeneralUser>;
  @useResult
  $Res call({bool? success, int? statusCode, String? message, User data});

  $UserCopyWith<$Res> get data;
}

/// @nodoc
class _$GeneralUserCopyWithImpl<$Res, $Val extends GeneralUser>
    implements $GeneralUserCopyWith<$Res> {
  _$GeneralUserCopyWithImpl(this._value, this._then);

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
              as User,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get data {
    return $UserCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GeneralUserImplCopyWith<$Res>
    implements $GeneralUserCopyWith<$Res> {
  factory _$$GeneralUserImplCopyWith(
          _$GeneralUserImpl value, $Res Function(_$GeneralUserImpl) then) =
      __$$GeneralUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? success, int? statusCode, String? message, User data});

  @override
  $UserCopyWith<$Res> get data;
}

/// @nodoc
class __$$GeneralUserImplCopyWithImpl<$Res>
    extends _$GeneralUserCopyWithImpl<$Res, _$GeneralUserImpl>
    implements _$$GeneralUserImplCopyWith<$Res> {
  __$$GeneralUserImplCopyWithImpl(
      _$GeneralUserImpl _value, $Res Function(_$GeneralUserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = freezed,
    Object? statusCode = freezed,
    Object? message = freezed,
    Object? data = null,
  }) {
    return _then(_$GeneralUserImpl(
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
              as User,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GeneralUserImpl with DiagnosticableTreeMixin implements _GeneralUser {
  const _$GeneralUserImpl(
      {required this.success,
      required this.statusCode,
      required this.message,
      required this.data});

  factory _$GeneralUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$GeneralUserImplFromJson(json);

  @override
  final bool? success;
  @override
  final int? statusCode;
  @override
  final String? message;
  @override
  final User data;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GeneralUser(success: $success, statusCode: $statusCode, message: $message, data: $data)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'GeneralUser'))
      ..add(DiagnosticsProperty('success', success))
      ..add(DiagnosticsProperty('statusCode', statusCode))
      ..add(DiagnosticsProperty('message', message))
      ..add(DiagnosticsProperty('data', data));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GeneralUserImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, success, statusCode, message, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GeneralUserImplCopyWith<_$GeneralUserImpl> get copyWith =>
      __$$GeneralUserImplCopyWithImpl<_$GeneralUserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GeneralUserImplToJson(
      this,
    );
  }
}

abstract class _GeneralUser implements GeneralUser {
  const factory _GeneralUser(
      {required final bool? success,
      required final int? statusCode,
      required final String? message,
      required final User data}) = _$GeneralUserImpl;

  factory _GeneralUser.fromJson(Map<String, dynamic> json) =
      _$GeneralUserImpl.fromJson;

  @override
  bool? get success;
  @override
  int? get statusCode;
  @override
  String? get message;
  @override
  User get data;
  @override
  @JsonKey(ignore: true)
  _$$GeneralUserImplCopyWith<_$GeneralUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
