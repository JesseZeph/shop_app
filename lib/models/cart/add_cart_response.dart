import 'package:json_annotation/json_annotation.dart';

part 'add_cart_response.g.dart';

@JsonSerializable(explicitToJson: true)
class AddCartResponse {
  final bool? success;
  final int? statusCode;
  final String? message;
  final Data? data;

  const AddCartResponse({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  factory AddCartResponse.fromJson(Map<String, dynamic> json) =>
      _$AddCartResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AddCartResponseToJson(this);

  AddCartResponse copyWith({
    bool? success,
    int? statusCode,
    String? message,
    Data? data,
  }) {
    return AddCartResponse(
      success: success ?? this.success,
      statusCode: statusCode ?? this.statusCode,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Data {
  final List<Products>? products;
  final int? totalPrice;
  final String? user;
  final String? Id;
  final String? createdAt;
  final String? updatedAt;
  final int? V;

  const Data({
    this.products,
    this.totalPrice,
    this.user,
    this.Id,
    this.createdAt,
    this.updatedAt,
    this.V,
  });

  factory Data.fromJson(Map<String, dynamic> json) =>
      _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);

  Data copyWith({
    List<Products>? products,
    int? totalPrice,
    String? user,
    String? Id,
    String? createdAt,
    String? updatedAt,
    int? V,
  }) {
    return Data(
      products: products ?? this.products,
      totalPrice: totalPrice ?? this.totalPrice,
      user: user ?? this.user,
      Id: Id ?? this.Id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      V: V ?? this.V,
    );
  }
}

@JsonSerializable(explicitToJson: true)
class Products {
  final String? product;
  final int? quantity;
  final String? Id;

  const Products({
    this.product,
    this.quantity,
    this.Id,
  });

  factory Products.fromJson(Map<String, dynamic> json) =>
      _$ProductsFromJson(json);

  Map<String, dynamic> toJson() => _$ProductsToJson(this);

  Products copyWith({
    String? product,
    int? quantity,
    String? Id,
  }) {
    return Products(
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
      Id: Id ?? this.Id,
    );
  }
}
