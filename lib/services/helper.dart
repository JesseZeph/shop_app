/*
import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:online_shop/models/orders/general.dart';
import 'package:online_shop/services/config.dart';

import '../models/orders/new_Sneaker_model.dart';
import '../models/orders/sneakers.dart';
import '../models/sneaker_model copy.dart';

// this class fetches data from the json file and return it to the app
class Helper {
  static var client = http.Client();
  // Male
  Future<List<Sneakers>> getMaleSneakers() async {
    var url = Uri.http(Config.apiUrl, Config.sneakers);
    var response = await client.get(url);

    log('The body ${response.body.toString()}');

    if (response.statusCode == 200) {
     
      try {
        GeneralModel myResponse = GeneralModel.fromJson(jsonDecode(response.body));
        log('The body ${myResponse.statusCode.toString()}');
      } catch (e){
        log('Akanimo'+e.toString());
      }

      List<dynamic> jsonResponse = json.decode(response.body);
      var maleList = jsonResponse.map((item) => Sneakers.fromJson(item)).toList();
      var male = maleList.where((element) => element.category == "Men's Running");
      return male.toList();
    } else {
      throw Exception('Failed to load jobs list');
    }
  }
  Future<List<Sneakers>> getMaleSneakerssn() async {
    var url = Uri.https(Config.apiUrl, Config.sneakers);
    var response = await http.get(url);
    log('The status code: ${response.body}');
    
    if (response.statusCode == 200) {
      GeneralModel myResponse = GeneralModel.fromJson(json.decode(response.body));
      List<Sneakers> maleList = myResponse.data
          .where((element) => element.category == "Men's Running")
          .toList();

      log('I am now working 000 ${maleList.toString()}');

      return maleList;
    } else {
      throw Exception('Failed to load sneakers list');
    }
  }

  // void fetchList() async {
  //   try {
  //     List<Sneakers> maleSneakersList = await getMaleSneakerssn();
  //     // Do something with the maleSneakersList
  //     for (var sneakers in maleSneakersList) {
  //       print('Sneaker Name: ${sneakers.name}');
  //       print('Sneaker Title: ${sneakers.title}');
  //       print('Sneaker Category: ${sneakers.category}');
  //       print('Sneaker Price: ${sneakers.price}');
  //       print('Sneaker Description: ${sneakers.description}');
  //       print('Sneaker Sizes:');
  //       for (var size in sneakers.sizes) {
  //         print(' - ${size.size}');
  //       }
  //       print('--------------------------------------------------');
  //     }
  //   } catch (e) {
  //     print('Error occurred: $e');
  //   }
  // }


  Future<List<Sneakers>> getMaleSneakerss() async {
    var url = Uri.http(Config.apiUrl, Config.sneakers);
    var response = await client.get(url);

    if (response.statusCode == 200) {
      var maleList = sneakersFromJson(response.body);
      var male =
          maleList.where((element) => element.category == "Men's Running");
      return male.toList();
    } else {
      throw Exception('Failed to load jobs list');
    }
  }

// Female
  Future<List<Sneakers>> getFemaleSneakers() async {
    var url = Uri.http(Config.apiUrl, Config.sneakers);
    var response = await client.get(url);

    if (response.statusCode == 200) {
      var maleList = sneakersFromJson(response.body);
      var female =
          maleList.where((element) => element.category == "Women's Running");
      return female.toList();
    } else {
      throw Exception('Failed to load jobs list');
    }
  }

// Kids
  Future<List<Sneakers>> getKidsSneakers() async {
    var url = Uri.http(Config.apiUrl, Config.sneakers);
    var response = await client.get(url);

    if (response.statusCode == 200) {
      var maleList = sneakersFromJson(response.body);
      var kids =
          maleList.where((element) => element.category == "Kids' Running");
      return kids.toList();
    } else {
      throw Exception('Failed to load jobs list');
    }
  }

  Future<List<Sneakers>> search(String searchQuery) async {
    var url = Uri.http(Config.apiUrl, "${Config.search}$searchQuery");
    var response = await client.get(url);
    if (response.statusCode == 200) {
      var results = sneakersFromJson(response.body);

      return results;
    } else {
      throw Exception('Failed to load products');
    }
  }
}
*/

import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:online_shop/models/orders/general.dart';
import 'package:online_shop/services/config.dart';

import '../models/orders/new_Sneaker_model.dart';
import '../models/orders/sneakers.dart';
import '../models/sneaker_model copy.dart';

// this class fetches data from the json file and return it to the app
class Helper {
  static var client = http.Client();
  // Male
  Future<List<StoreProduct>> getMaleSneakers() async {
    var url = Uri.http(Config.apiUrl, Config.sneakers);
    var response = await client.get(url);

    // log('The body ${response.body.toString()}');

    if (response.statusCode == 200) {
      try {
        var data = jsonDecode(response.body);
        GeneralModel myResponse = GeneralModel.fromJson(data);
        // log('The body ${myResponse.statusCode.toString()}');
      } catch (e) {
        // log('Akanimo$e');
      }

      List<dynamic> jsonResponse = json.decode(response.body);
      var maleList =
          jsonResponse.map((item) => StoreProduct.fromJson(item)).toList();
      var male =
          maleList.where((element) => element.category == "Men's Running");
      return male.toList();
    } else {
      throw Exception('Failed to load jobs list');
    }
  }

  Future<List<StoreProduct>> getMaleSneakerssn() async {
    var url = Uri.https(Config.apiUrl, Config.sneakers);
    var response = await http.get(url);
    // log('The status code: ${response.body}');

    if (response.statusCode == 200) {
      GeneralModel myResponse =
          GeneralModel.fromJson(json.decode(response.body));
      List<StoreProduct> maleList = myResponse.data!
          .where((element) => element.category == "Men's Running")
          .toList();

      // log('I am now working 000 ${maleList.toString()}');

      return maleList;
    } else {
      throw Exception('Failed to load sneakers list');
    }
  }

  // void fetchList() async {
  //   try {
  //     List<Sneakers> maleSneakersList = await getMaleSneakerssn();
  //     // Do something with the maleSneakersList
  //     for (var sneakers in maleSneakersList) {
  //       print('Sneaker Name: ${sneakers.name}');
  //       print('Sneaker Title: ${sneakers.title}');
  //       print('Sneaker Category: ${sneakers.category}');
  //       print('Sneaker Price: ${sneakers.price}');
  //       print('Sneaker Description: ${sneakers.description}');
  //       print('Sneaker Sizes:');
  //       for (var size in sneakers.sizes) {
  //         print(' - ${size.size}');
  //       }
  //       print('--------------------------------------------------');
  //     }
  //   } catch (e) {
  //     print('Error occurred: $e');
  //   }
  // }

// Female
  Future<List<StoreProduct>> getFemaleSneakers() async {
    var url = Uri.http(Config.apiUrl, Config.sneakers);
    var response = await client.get(url);

    if (response.statusCode == 200) {
      GeneralModel? maleList;
      try {
        // print(response.body);
        var data = jsonDecode(response.body);

        maleList = GeneralModel.fromJson(data);
      } catch (e) {
        print(e.toString());
      }
      var female = maleList!.data!
          .where((element) => element.category == "Women's Running");
      return female.toList();
    } else {
      throw Exception('Failed to load jobs list');
    }
  }

// Kids
  Future<List<StoreProduct>> getProducts(String category) async {
    log(category);
    if (category == 'furnitures') {
      log('New Akanimo Furnitures');
      log(category);
    }

    var headers = {
      "Accept": "application/json",
      'Content-Type': 'application/json',
    };
    Response response;
    try {
      Dio dio = Dio();
      response = await dio.get("https://${Config.apiUrl}${Config.sneakers}",
          options: Options(
            contentType: Headers.acceptHeader,
            headers: headers,
          ));
      log('Response Code' + response.data.toString());

      if (response.statusCode == 200) {
        var maleList = GeneralModel.fromJson(response.data);
        log('New Akanimo' + maleList.statusCode.toString());

        log(maleList.toString());
        var kids =
            maleList.data!.where((element) => element.category == category);

        log('New Akanimo List' + kids.toString());

        return kids.toList();
      } else {
        throw Exception('Failed to load jobs list');
      }
    } on DioError catch (e) {
      if (e.response != null) {
        print(e.response!.data);
        print(e.response!.headers);
        print(e.response!.requestOptions);
        throw ('Fetch store account exception $e');
      } else {
        print(e.requestOptions);
        print(e.message);
        throw ('Fetch store account exception $e');
      }

      /*  http.Request request;

    request = http.Request(
        'GET', Uri.parse("https://${Config.apiUrl}${Config.sneakers}"));

    http.StreamedResponse response = await request.send();



    if (response.statusCode == 200) {
      var maleList = GeneralModel.fromJson(
          await json.decode( await response.stream.bytesToString()));
      var kids = maleList.data!
          .where((element) => element.category == "Kids' Running");
      return kids.toList();
    } else {
      throw Exception('Failed to load jobs list');
    } */
    }
  }

  Future<List<StoreProduct>> search(String searchQuery) async {
    var url = Uri.http(Config.apiUrl, "${Config.search}$searchQuery");
    var response = await client.get(url);
    if (response.statusCode == 200) {
      var results = sneakersFromJson(response.body);

      return results;
    } else {
      throw Exception('Failed to load products');
    }
  }
}
