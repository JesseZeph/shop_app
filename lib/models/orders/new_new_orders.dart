import 'dart:convert';

NewNewOrders newNewOrdersFromJson(String str) =>
    NewNewOrders.fromJson(json.decode(str));

String newNewOrdersToJson(NewNewOrders data) => json.encode(data.toJson());

class NewNewOrders {
  NewNewOrders({
    required this.success,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  NewNewOrders.fromJson(dynamic json) {
    success = json['success'];
    statusCode = json['statusCode'];
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data.add(NewData.fromJson(v));
      });
    }
  }

 late bool success;
  late int statusCode;
  late String message;
  late List<NewData> data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['statusCode'] = statusCode;
    map['message'] = message;
    if (data != null) {
      map['data'] = data.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

NewData dataFromJson(String str) => NewData.fromJson(json.decode(str));

String dataToJson(NewData data) => json.encode(data.toJson());

class NewData {
  NewData({
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
    required this.v,
  });

  NewData.fromJson(dynamic json) {
    id = json['_id'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products.add(Products.fromJson(v));
      });
    }
    user = json['user'];
    address = json['address'];
    totalPrice = json['totalPrice'];
    paymentMethod = json['paymentMethod'];
    paymentStatus = json['paymentStatus'];
    orderStatus = json['orderStatus'];
    deliveryType = json['deliveryType'];
    deliveryStatus = json['deliveryStatus'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }

  late final String id;
  late final List<Products> products;
  late final String user;
  late final String address;
  late final int totalPrice;
  late final String paymentMethod;
  late final String paymentStatus;
  late final String orderStatus;
  late final String deliveryType;
  late final String deliveryStatus;
  late final String createdAt;
  late final String updatedAt;
  late final int v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    if (products != null) {
      map['products'] = products.map((v) => v.toJson()).toList();
    }
    map['user'] = user;
    map['address'] = address;
    map['totalPrice'] = totalPrice;
    map['paymentMethod'] = paymentMethod;
    map['paymentStatus'] = paymentStatus;
    map['orderStatus'] = orderStatus;
    map['deliveryType'] = deliveryType;
    map['deliveryStatus'] = deliveryStatus;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    return map;
  }
}

Products productsFromJson(String str) => Products.fromJson(json.decode(str));

String productsToJson(Products data) => json.encode(data.toJson());

class Products {
  Products({
    required this.product,
    required this.quantity,
    required this.id,
  });

  Products.fromJson(dynamic json) {
    product = json['product'];
    quantity = json['quantity'];
    id = json['_id'];
  }

  late String product;
  late int quantity;
  late String id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['product'] = product;
    map['quantity'] = quantity;
    map['_id'] = id;
    return map;
  }
}
