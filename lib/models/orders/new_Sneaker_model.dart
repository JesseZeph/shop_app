/*
import 'dart:convert';

class ApiResponse {
  final bool success;
  final int statusCode;
  final String message;
  final List<Sneakerss> data;

  ApiResponse({
    required this.success,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      success: json['success'],
      statusCode: json['statusCode'],
      message: json['message'],
      data: List<Sneakerss>.from(
          json['data'].map((x) => Sneakerss.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "success": success,
    "statusCode": statusCode,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Sneakerss {
  final String id;
  final List<String> images;
  final String name;
  final int stock;
  final String title;
  final String category;
  final List<String> imageUrl;
  final String oldPrice;
  final List<Size> sizes;
  final int price;
  final String description;
  final int v;


  Sneakerss(
    {
      required this.images,
      required this.stock,
      required this.v,
    required this.id,
    required this.name,
    required this.title,
    required this.category,
    required this.imageUrl,
    required this.oldPrice,
    required this.sizes,
    required this.price,
    required this.description,
  });

  factory Sneakerss.fromJson(Map<String, dynamic> json) {
    return Sneakerss(
      id: json["_id"],
      name: json["name"],
      title: json["title"],
      category: json["category"],
      imageUrl: List<String>.from(json["imageUrl"].map((x) => x)),
      oldPrice: json["oldPrice"],
      sizes: List<Size>.from(
          json["sizes"].map((x) => Size.fromJson(x))),
      price: json["price"],
      description: json["description"],
      images: List<String>.from(json["images"].map((x) => x)),
      stock: json["stock"],
      v: json["__v"],
    );
  }

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "title": title,
    "category": category,
    "imageUrl": List<dynamic>.from(imageUrl.map((x) => x)),
    "images": List<dynamic>.from(images.map((x) => x)),
    "oldPrice": oldPrice,
    "sizes": List<dynamic>.from(sizes.map((x) => x.toJson())),
    "price": price,
    "stock": stock,
    "__v": v,
    "description": description,
  };
}

class Size {
  final String size.dart;
  final bool isSelected;
  final String id;

  Size({
    required this.size.dart,
    required this.isSelected,
    required this.id,
  });

  factory Size.fromJson(Map<String, dynamic> json) {
    return Size(
      size.dart: json["size.dart"],
      isSelected: json["isSelected"],
      id: json["_id"],
    );
  }

  Map<String, dynamic> toJson() => {
    "size.dart": size.dart,
    "isSelected": isSelected,
    "_id": id,
  };
}

ApiResponse apiResponseFromJson(String str) =>
    ApiResponse.fromJson(json.decode(str));

String apiResponseToJson(ApiResponse data) => json.encode(data.toJson());
*//*


class ApiResponse {
  final bool success;
  final int statusCode;
  final String message;
  final List<Sneakerss> data;

  ApiResponse({
    required this.success,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      success: json['success'],
      statusCode: json['statusCode'],
      message: json['message'],
      data: List<Sneakerss>.from(
          json['data'].map((x) => Sneakerss.fromJson(x))),
    );
  }
}

class Sneakerss {
  final String id;
  final List<String> images;
  final int stock;
  final String name;
  final String title;
  final String category;
  final List<String> imageUrl;
  final String oldPrice;
  final bool isSelected;
  final List<Size> sizes;
  final int price;
  final String description;
  final int v;

  Sneakerss({
    required this.id,
    required this.images,
    required this.stock,
    required this.name,
    required this.title,
    required this.category,
    required this.imageUrl,
    required this.oldPrice,
    required this.isSelected,
    required this.sizes,
    required this.price,
    required this.description,
    required this.v,
  });

  factory Sneakerss.fromJson(Map<String, dynamic> json) {
    return Sneakerss(
      id: json['_id'],
      images: List<String>.from(json['images'].map((x) => x)),
      stock: json['stock'],
      name: json['name'],
      title: json['title'] ?? '',
      category: json['category'],
      imageUrl: List<String>.from(json['imageUrl'].map((x) => x)),
      oldPrice: json['oldPrice'],
      isSelected: json['isSelected'],
      sizes: List<Size>.from(json['sizes'].map((x) => Size.fromJson(x))),
      price: json['price'],
      description: json['description'],
      v: json['__v'],
    );
  }
}

class Size {
  final String size;
  final bool isSelected;
  final String id;

  Size({
    required this.size,
    required this.isSelected,
    required this.id,
  });

  factory Size.fromJson(Map<String, dynamic> json) {
    return Size(
      size: json['size.dart'],
      isSelected: json['isSelected'],
      id: json['_id'],
    );
  }
}

*/
