import 'package:flutter/foundation.dart';
import 'package:online_shop/models/cart/get_products.dart';

class CartProvider with ChangeNotifier {
  int _counter = 1;

  int get counter => _counter;

  void increment() {
    _counter++;
    notifyListeners();
  }

  void decrement() {
    if (_counter >= 1) {
      _counter--;
      notifyListeners();
    }
  }

  List<Product> checkOutList = [];

  List<Product> get getCheckOutList => checkOutList;

  set setCheckOut(Product newProduct) {
    if (checkOutList.contains(newProduct.id)) {
      checkOutList.removeWhere((element) => element.id == newProduct.id);
    } else {
      checkOutList.add(newProduct);
    }
    
    notifyListeners();
  }
}
