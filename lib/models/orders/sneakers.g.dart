// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sneakers.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SneakersImpl _$$SneakersImplFromJson(Map<String, dynamic> json) =>
    _$SneakersImpl(
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      stock: json['stock'] as int?,
      name: json['name'] as String?,
      title: json['title'] as String?,
      category: json['category'] as String?,
      oldPrice: json['oldPrice'] as String?,
      isSelected: json['isSelected'] as bool?,
      price: json['price'] as int?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$SneakersImplToJson(_$SneakersImpl instance) =>
    <String, dynamic>{
      'images': instance.images,
      'stock': instance.stock,
      'name': instance.name,
      'title': instance.title,
      'category': instance.category,
      'oldPrice': instance.oldPrice,
      'isSelected': instance.isSelected,
      'price': instance.price,
      'description': instance.description,
    };
