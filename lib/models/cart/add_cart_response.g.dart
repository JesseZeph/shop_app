// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_cart_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddCartResponse _$AddCartResponseFromJson(Map<String, dynamic> json) =>
    AddCartResponse(
      success: json['success'] as bool?,
      statusCode: json['statusCode'] as int?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AddCartResponseToJson(AddCartResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data?.toJson(),
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => Products.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPrice: json['totalPrice'] as int?,
      user: json['user'] as String?,
      Id: json['Id'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      V: json['V'] as int?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'products': instance.products?.map((e) => e.toJson()).toList(),
      'totalPrice': instance.totalPrice,
      'user': instance.user,
      'Id': instance.Id,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'V': instance.V,
    };

Products _$ProductsFromJson(Map<String, dynamic> json) => Products(
      product: json['product'] as String?,
      quantity: json['quantity'] as int?,
      Id: json['Id'] as String?,
    );

Map<String, dynamic> _$ProductsToJson(Products instance) => <String, dynamic>{
      'product': instance.product,
      'quantity': instance.quantity,
      'Id': instance.Id,
    };
