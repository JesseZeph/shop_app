
class GetCartResponse {
  GetCartResponse({
      bool? success, 
      num? statusCode, 
      String? message, 
      Data? data,}){
    _success = success;
    _statusCode = statusCode;
    _message = message;
    _data = data;
}

  GetCartResponse.fromJson(dynamic json) {
    _success = json['success'] ?? false;
    _statusCode = json['statusCode'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _success;
  num? _statusCode;
  String? _message;
  Data? _data;
GetCartResponse copyWith({  bool? success,
  num? statusCode,
  String? message,
  Data? data,
}) => GetCartResponse(  success: success ?? _success,
  statusCode: statusCode ?? _statusCode,
  message: message ?? _message,
  data: data ?? _data,
);
  bool? get success => _success;
  num? get statusCode => _statusCode;
  String? get message => _message;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['statusCode'] = _statusCode;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}


class Data {
  Data({
      String? id, 
      List<MProducts>? products,
      num? totalPrice,
      String? user,}){
    _id = id;
    _products = products;
    _totalPrice = totalPrice;
    _user = user;
}

  Data.fromJson(dynamic json) {
    _id = json['_id'];
    if (json['products'] != null) {
      _products = [];
      json['products'].forEach((v) {
        _products?.add(MProducts.fromJson(v));
      });
    }
    _totalPrice = json['totalPrice'];
    _user = json['user'];
  }
  String? _id;
  List<MProducts>? _products;
  num? _totalPrice;
  String? _user;
Data copyWith({  String? id,
  List<MProducts>? products,
  num? totalPrice,
  String? user,
}) => Data(  id: id ?? _id,
  products: products ?? _products,
  totalPrice: totalPrice ?? _totalPrice,
  user: user ?? _user,
);
  String? get id => _id;
  List<MProducts>? get products => _products;
  num? get totalPrice => _totalPrice;
  String? get user => _user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    if (_products != null) {
      map['products'] = _products?.map((v) => v.toJson()).toList();
    }
    map['totalPrice'] = _totalPrice;
    map['user'] = _user;
    return map;
  }

}


class MProducts {
  MProducts({
    ProductItem1? product,
      num? quantity,}){
    _product = product;
    _quantity = quantity;
}

  MProducts.fromJson(dynamic json) {
    _product = json['product'] != null ? ProductItem1.fromJson(json['product']) : null;
    _quantity = json['quantity'];
  }
  ProductItem1? _product;
  num? _quantity;
MProducts copyWith({  ProductItem1? product,
  num? quantity,
}) => MProducts(  product: product ?? _product,
  quantity: quantity ?? _quantity,
);
  ProductItem1? get product => _product;
  num? get quantity => _quantity;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_product != null) {
      map['product'] = _product?.toJson();
    }
    map['quantity'] = _quantity;
    return map;
  }

}


class ProductItem1 {
  ProductItem1({
      num? stock, 
      String? name, 
      String? description, 
      String? category, 
      List<String>? images, 
      num? price, 
      num? discountPrice, 
      String? id,})
  {
    _stock = stock;
    _name = name;
    _description = description;
    _category = category;
    _images = images;
    _price = price;
    _discountPrice = discountPrice;
    _id = id;
}

  ProductItem1.fromJson(dynamic json) {
    _stock = json['stock'];
    _name = json['name'];
    _description = json['description'];
    _category = json['category'];
    _images = json['images'] != null ? json['images'].cast<String>() : [];
    _price = json['price'];
    _discountPrice = json['discountPrice'];
    _id = json['id'];
  }
  num? _stock;
  String? _name;
  String? _description;
  String? _category;
  List<String>? _images;
  num? _price;
  num? _discountPrice;
  String? _id;
  ProductItem1 copyWith({  num? stock,
  String? name,
  String? description,
  String? category,
  List<String>? images,
  num? price,
  num? discountPrice,
  String? id,
}) => ProductItem1(  stock: stock ?? _stock,
  name: name ?? _name,
  description: description ?? _description,
  category: category ?? _category,
  images: images ?? _images,
  price: price ?? _price,
  discountPrice: discountPrice ?? _discountPrice,
  id: id ?? _id,
);
  num? get stock => _stock;
  String? get name => _name;
  String? get description => _description;
  String? get category => _category;
  List<String>? get images => _images;
  num? get price => _price;
  num? get discountPrice => _discountPrice;
  String? get id => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['stock'] = _stock;
    map['name'] = _name;
    map['description'] = _description;
    map['category'] = _category;
    map['images'] = _images;
    map['price'] = _price;
    map['discountPrice'] = _discountPrice;
    map['id'] = _id;
    return map;
  }

}