import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:online_shop/models/cart/add_to_cart.dart';
import 'package:online_shop/models/cart/get_products.dart';
import 'package:online_shop/models/orders/orders_res.dart';
import 'package:online_shop/models/orders/waitlist/get_wait_lists.dart';
import 'package:online_shop/services/config.dart';
import 'package:online_shop/views/ui/orders/orders.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/cart/add_cart_response.dart';
import '../models/cart/get_cart_response.dart';
import '../models/orders/sneakers.dart';
import '../models/orders/waitlist/add_to_waitlist_response.dart';
import '../models/orders/new_orders.dart';
import '../util/g_storage.dart';

class WaitListHelper {
  static var client = http.Client();

// Add to cart HELPER

  static Future<AddToWaitlistResponse> newAddtoWaitList(AddToCart model) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    print(token);
    print(model.productId);

    var url = Uri.parse(
        'https://exceedingproperties-production.up.railway.app/waitlist/${model.productId}');
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    var response = await http.post(url, headers: headers);
    print('ResponseCode  ' + response.statusCode.toString());

    try {
      log('ResponseCode  ' + response.statusCode.toString());
      if (response.statusCode == 200) {
        AddToWaitlistResponse addresponse =
            AddToWaitlistResponse.fromJson(jsonDecode(response.body));

        print("User registered successfully.${addresponse.message}");
        return addresponse;
      } else {
        AddToWaitlistResponse addresponse =
            AddToWaitlistResponse.fromJson(jsonDecode(response.body));

        print('Failed to register user. Error: ${response.body}');
        return addresponse;
      }
    } catch (e) {
      print('Failed to register user. Exception: $e');
      throw new Error();
    }
  }

  static Future<List<WaitlistItem>> getCartProduct() async {
    log(' I came');
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };

    var url = Uri.https(Config.apiUrl, Config.waitlist);
    var response = await http.get(url, headers: requestHeaders);

    log(response.body);

    if (response.statusCode == 200) {
      WaitlistResponse myResponse = WaitlistResponse.fromJson(json.decode(response.body));
      List<WaitlistItem>? cart = [];

      cart = myResponse.data.toList();

      log(cart!.length.toString());

      return cart;
    } else {
      throw Exception('Failed to get a cart');
    }
  }

  static Future<AddToWaitlistResponse> deletefromCart(String id) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    var url =
        Uri.parse('https://exceedingproperties-production.up.railway.app/waitlist/$id');
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };

    try {
      var response = await http.delete(url, headers: headers,);
      if (response.statusCode == 200) {

        AddToWaitlistResponse addresponse =
        AddToWaitlistResponse.fromJson(jsonDecode(response.body));
        return addresponse;
      } else {
        AddToWaitlistResponse addresponse =
        AddToWaitlistResponse.fromJson(jsonDecode(response.body));
        print('Failed to register user. Error: ${response.body}');
        return addresponse;
      }
    } catch (e) {
      print('Failed to register user. Exception: $e');
      throw new Error();
    }
  }

  static Future<Sneakers> getSingleProduct(String productId) async {

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };

    var url = Uri.https(Config.apiUrl, '${Config.sneakers}/$productId');
    print(url);
    var response = await http.get(url, headers: requestHeaders);

    log(response.body);

    if (response.statusCode == 200) {
      Sneakers myResponse = Sneakers.fromJson(json.decode(response.body));

      return myResponse;
    } else {
      throw Exception('Failed to get a cart');
    }




  }

//GET CART HELPER
}
