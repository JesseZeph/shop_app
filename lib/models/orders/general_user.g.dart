// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'general_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GeneralUserImpl _$$GeneralUserImplFromJson(Map<String, dynamic> json) =>
    _$GeneralUserImpl(
      success: json['success'] as bool?,
      statusCode: json['statusCode'] as int?,
      message: json['message'] as String?,
      data: User.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$GeneralUserImplToJson(_$GeneralUserImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };
