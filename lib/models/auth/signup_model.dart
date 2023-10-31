import 'dart:convert';

SignupModel signupModelFromJson(String str) =>
    SignupModel.fromJson(json.decode(str));

String signupModelToJson(SignupModel data) => json.encode(data.toJson());

class SignupModel {
  SignupModel({
    required this.username,
    required this.email,
    required this.password,
  });

  final String username;
  final String email;
  final String password;

  factory SignupModel.fromJson(Map<String, dynamic> json) => SignupModel(
        username: json["username"],
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "email": email,
        "password": password,
      };
}

class SignupResponse {
  bool success;
  int statusCode;
  String message;
  Data data;

  SignupResponse(
      {required this.success,
      required this.statusCode,
      required this.message,
      required this.data});


  factory SignupResponse.fromJson(Map<String, dynamic> json) {
      return SignupResponse(
          success: json['success'],
          statusCode: json['statusCode'],
          message: json['message'],
          data: Data.fromJson(json['data']),
      );
  }
}

class Data {
    String _id;
    String username;
    String email;

    Data(
        this._id, {
            required this.username,
            required this.email,
        });

    factory Data.fromJson(Map<String, dynamic> json) {
        return Data(
            json["_id"],
            username: json["username"],
            email: json["email"],
        );
    }
}
