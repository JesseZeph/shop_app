class WaitlistResponse {
  final bool success;
  final int statusCode;
  final String message;
  final List<WaitlistItem> data;

  WaitlistResponse({
    required this.success,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory WaitlistResponse.fromJson(Map<String, dynamic> json) {
    List<WaitlistItem> waitlistItems = <WaitlistItem>[];
    if (json['data'] != null) {
      waitlistItems = List<WaitlistItem>.from(
        json['data'].map((item) => WaitlistItem.fromJson(item)),
      );
    }

    return WaitlistResponse(
      success: json['success'] ?? false,
      statusCode: json['statusCode'] ?? 0,
      message: json['message'] ?? '',
      data: waitlistItems,
    );
  }
}

class WaitlistItem {
  final String id;
  final String userId;
  final Product product;
  final int quantity;
  final DateTime createdAt;
  final DateTime updatedAt;

  WaitlistItem({
    required this.id,
    required this.userId,
    required this.product,
    required this.quantity,
    required this.createdAt,
    required this.updatedAt,
  });

  factory WaitlistItem.fromJson(Map<String, dynamic> json) {
    return WaitlistItem(
      id: json['_id'] ?? '',
      userId: json['user'] ?? '',
      product: Product.fromJson(json['product']),
      quantity: json['quantity'] ?? 0,
      createdAt: DateTime.parse(json['createdAt'] ?? ''),
      updatedAt: DateTime.parse(json['updatedAt'] ?? ''),
    );
  }
}

class Product {
  final String id;
  final String name;
  final String description;
  final String category;
  final List<String> images;
  final double price;
  final double discountPrice;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int stock;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.images,
    required this.price,
    required this.discountPrice,
    required this.createdAt,
    required this.updatedAt,
    required this.stock,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      category: json['category'] ?? '',
      images: List<String>.from(json['images'] ?? []),
      price: (json['price'] ?? 0).toDouble(),
      discountPrice: (json['discountPrice'] ?? 0).toDouble(),
      createdAt: DateTime.parse(json['createdAt'] ?? ''),
      updatedAt: DateTime.parse(json['updatedAt'] ?? ''),
      stock: json['stock'] ?? 0,
    );
  }
}
