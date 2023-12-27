import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:online_shop/models/cart/add_to_cart.dart';
import 'package:online_shop/models/cart/get_products.dart';
import 'package:online_shop/models/orders/orders_res.dart';
import 'package:online_shop/services/config.dart';
import 'package:online_shop/views/ui/orders/orders.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/cart/add_cart_response.dart';
import '../models/cart/get_cart_response.dart';
import '../models/orders/new_orders.dart';
import '../util/g_storage.dart';

class CartHelper {
  static var client = http.Client();

// Add to cart HELPER

  static Future<bool> addToCart(AddToCart model) async {
    log('Add to cart triggered and model is ${model.toJson().toString()}');

    var modeldata = jsonEncode(model.toJson());
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
      'Content-Length': modeldata.length.toString(),
      // Add the Content-Length header
      "Accept": "application/json",
      "Host": "'exceedingproperties-production.up.railway.app'",
    };

    var url = Uri.https(
        'exceedingproperties-production.up.railway.app', Config.addCartUrl);
    var response = await client.post(url,
        headers: requestHeaders, body: jsonEncode(model.toJson()));

    log('Akanimo status ${response.statusCode}');
    log(' Akanimo token ${token}');
    log(' Akanimo url ${url}');

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static Future<AddCartResponse> newAddtoCart(AddToCart model) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    var url =
        Uri.parse('https://exceedingproperties-production.up.railway.app/cart');
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    var body = jsonEncode({
      "productId": model.productId,
      "quantity": model.quantity,
    });
    log('The new Model ' + body);
    try {
      var response = await http.post(url, headers: headers, body: body);
      if (response.statusCode == 200) {
        AddCartResponse addresponse =
            AddCartResponse.fromJson(jsonDecode(response.body));

        print("User registered successfully.${addresponse.data!.totalPrice}");
        return addresponse;
      } else {
        print('Failed to register user. Error: ${response.body}');
        throw new Error();
      }
    } catch (e) {
      print('Failed to register user. Exception: $e');
      throw new Error();
    }
  }

  static Future<bool> addingToDart(AddToCart model) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    var jsonData = jsonEncode(model.toJson());

    log('User Tokens ' + token!);
    // addToCart(model);

    var headers = {
      "Accept": "application/json",
      'Content-Type': 'application/json',
      'Content-Length': jsonData.length.toString(),
      // Add the Content-Length header
      'Authorization': 'Bearer $token',
    };

    Response response;

    try {
      Dio dio = Dio();
      var link = "https://${Config.apiUrl}${Config.addCartUrl}";

      log('Response Code  $link');
      log('JsonData  $jsonData');

      response = await dio.post(link,
          data: jsonData,
          options: Options(
            contentType: Headers.acceptHeader,
            method: 'POST',
            headers: headers,
          ));

      log('Response Code  $link');

      if (response.statusCode == 200) {
        AddCartResponse cartResponse = AddCartResponse.fromJson(response.data);
        log('Shop Cart ${cartResponse.message}');

        return true;
      } else {
        throw Exception('Failed to load user profile');
      }
    } catch (ex) {
      print(ex);
      return false;
    }
  }

  void makePostRequest() async {
    Dio dio = Dio();

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    String url =
        "https://${Config.apiUrl}${Config.addCartUrl}"; // Replace with your API endpoint

    Map<String, dynamic> postData = {
      "productId": "653f95cda3427e2a9ec01adb",
      "quantity": 1
    };

    try {
      Response response = await dio.post(
        url,
        data: jsonEncode(postData), // Convert the postData to a JSON string
        options: Options(
          headers: {
            "Content-Type": "application/json",
            // Set the content type of the request
            // Add other headers if needed
          },
        ),
      );

      if (response.statusCode == 200) {
        // Handle the successful response here
        print("Post request successful: ${response.data}");
      } else {
        // Handle the response error here
        print("Error: ${response.statusCode}");
      }
    } catch (e) {
      // Handle any exceptions
      print("Exception: $e");
    }
  }

  static Future<List<Product>> getCart() async {
    getCartProduct();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };

    var url = Uri.https(Config.apiUrl, Config.getCartUrl);
    var response = await http.get(url, headers: requestHeaders);

    // log("${response.statusCode}+ Response: Code");

    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      List<Product> cart = [];

      var products = jsonData[0]['products'];
      cart = List<Product>.from(
          products.map((product) => Product.fromJson(product)));

      return cart;
    } else {
      throw Exception('Failed to get a cart');
    }
  }

  static Future<List<MProducts>?> getCartProduct() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };

    var url = Uri.https(Config.apiUrl, Config.getCartUrl);
    var response = await http.get(url, headers: requestHeaders);

    if (response.statusCode == 200) {
      GetCartResponse cartResponse =
          GetCartResponse.fromJson(jsonDecode(response.body));
      List<MProducts>? cart = [];

      cart = cartResponse.data?.products?.toList();

      return cart;
    } else {
      throw Exception('Failed to get a cart');
    }
  }

  static Future<bool> deleteItem(String id) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };

    var url = Uri.http(Config.apiUrl, "${Config.addCartUrl}/$id");
    var response = await client.delete(url, headers: requestHeaders);

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> deletefromCart(String id) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    var url =
        Uri.parse('https://exceedingproperties-production.up.railway.app/cart');
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    var body = jsonEncode({
      "productId": id,
    });

    log('The new Model ' + body);
    try {
      var response = await http.delete(url, headers: headers, body: body);
      if (response.statusCode == 200) {
        return true;
      } else {
        print('Failed to register user. Error: ${response.body}');
        throw new Error();
      }
    } catch (e) {
      print('Failed to register user. Exception: $e');
      throw new Error();
    }
  }

  //GET CART HELPER

  static Future<List<PaidOrders>> getOrders() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    String mToken = AppStorage.mybox.read(AppStorage.token);
    log(mToken);

    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $mToken'
    };
    var url = Uri.parse(
        'https://exceedingproperties-production.up.railway.app/order');
    log('$url');

    var response = await http.get(url, headers: requestHeaders);
    print(response.body.toString());

    if (response.statusCode == 200) {
      var products = paidOrdersFromJson(response.body);

      return products;
    } else {
      throw Exception('Failed to get a cart');
    }
  }

/*
  static Future<List<OrderProducts>> newGetOrders() async {

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    String mToken = AppStorage.mybox.read(AppStorage.token);
    log(mToken);

    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $mToken'
    };
    var url = Uri.parse('https://${Config.apiUrl}${Config.orders}');
    log('$url');

    var response = await http.get(url, headers: requestHeaders);
    print(response.body.toString());

    if (response.statusCode == 200) {
      // var products = NewOrders.fromJson(response.body);

      NewOrders newOrders  = NewOrders.fromJson(response.body);
      var products = newOrders.data;

      return products;
    } else {
      throw Exception('Failed to get a cart');
    }
  }
*/

  static Future<List<Order>> fetchOrders() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    String mToken = AppStorage.mybox.read(AppStorage.token);
    log(mToken);

    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $mToken'
    };
    var url = Uri.parse('https://${Config.apiUrl}${Config.orders}');
    log('$url');

    var response = await http.get(url, headers: requestHeaders);

    if (response.statusCode == 200) {
      final List<dynamic> decoded = json.decode(response.body)['data'];

      List<Order> orders = decoded.map((order) => Order.fromJson(order)).toList();

      return orders;
    }else{
      throw Exception('Failed to get a cart');

    }
  }
}
