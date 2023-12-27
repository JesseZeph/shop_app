class Order {
  final String id;
  final List<Map<String, dynamic>> products;
  final String user;
  final String address;
  final int totalPrice;
  final String paymentMethod;
  final String paymentStatus;
  final String orderStatus;
  final String deliveryType;
  final String deliveryStatus;
  final String createdAt;
  final String updatedAt;

  Order({
    required this.id,
    required this.products,
    required this.user,
    required this.address,
    required this.totalPrice,
    required this.paymentMethod,
    required this.paymentStatus,
    required this.orderStatus,
    required this.deliveryType,
    required this.deliveryStatus,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['_id'],
      products: List<Map<String, dynamic>>.from(json['products']),
      user: json['user'],
      address: json['address'],
      totalPrice: json['totalPrice'],
      paymentMethod: json['paymentMethod'],
      paymentStatus: json['paymentStatus'],
      orderStatus: json['orderStatus'],
      deliveryType: json['deliveryType'],
      deliveryStatus: json['deliveryStatus'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }
}
