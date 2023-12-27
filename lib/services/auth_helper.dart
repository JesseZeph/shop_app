import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:online_shop/models/auth/login_model.dart';
import 'package:online_shop/models/auth/signup_model.dart';
import 'package:online_shop/models/auth_response/login_res_model.dart';
import 'package:online_shop/models/auth_response/profile_model.dart';
import 'package:online_shop/models/orders/general_user.dart';
import 'package:online_shop/models/orders/orders_req.dart';
import 'package:online_shop/services/config.dart';
import 'package:online_shop/util/g_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthHelper {
  static var client = http.Client();

// LOGIN HELPER

  static Future<bool> login(LoginModel model) async {
    log('login called');
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.https(Config.apiUrl, Config.loginUrl);
    var response = await client.post(url,
        headers: requestHeaders, body: jsonEncode(model.toJson()));

    ResponseModel loginResponse = ResponseModel.fromJson(jsonDecode(response.body));

    if (loginResponse.statusCode == 200) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      AppStorage.mybox.write(AppStorage.token, loginResponse.data.token);

      String userToken = loginResponse.data.token ?? "";
      String userId = loginResponse.data.id ?? "";

      await prefs.setString('token', userToken);
      await prefs.setString('userId', userId);

      await prefs.setBool('loggedIn', true);

      return true;
    } else {
      return false;
    }
  }


// SIGN UP HELPER
  static Future<bool> signup(SignupModel model) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.https(Config.apiUrl, Config.signupUrl);
    var response = await client.post(url,
        headers: requestHeaders, body: jsonEncode(model.toJson()));

    SignupResponse signupResponse = SignupResponse.fromJson(jsonDecode(response.body));

    if (signupResponse.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static Future<ProfileRes> getProfile() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    log('User Token'+ token!);

    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'token': 'Bearer $token'
    };

    var url = Uri.http(Config.apiUrl, Config.profile);
    var response = await client.get(url, headers: requestHeaders);

    log('User Profile'+response.body);
    if (response.statusCode == 200) {
      var profile = profileResFromJson(response.body);

      return profile;
    } else {
      throw Exception('Failed to get a profile');
    }
  }

  static Future<GeneralUser> getUserProfile() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    log('User Tokens ' + token!);
    var headers = {
      "Accept": "application/json",
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    Response response;
    try {
      Dio dio = Dio();
      response = await dio.get("https://${Config.apiUrl}${Config.profile}",
          options: Options(
            contentType: Headers.acceptHeader,
            headers: headers,
          ));
      log('Response Code' + response.data.toString());

      if (response.statusCode == 200) {
        GeneralUser profileRes = GeneralUser.fromJson(response.data);
        log(profileRes.data.username.toString());
        return profileRes;
      } else {
        throw Exception('Failed to load user profile');
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
    }
  }

}
