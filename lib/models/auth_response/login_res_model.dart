import 'dart:convert';

LoginResponseModel loginResponseModelFromJson(String str) => LoginResponseModel.fromJson(json.decode(str));


class LoginResponseModel {
    LoginResponseModel({
        required this.id,
        required this.token,
    });

    final String id;
    final String token;

    factory LoginResponseModel.fromJson(Map<String, dynamic> json) => LoginResponseModel(
        id: json["_id"],
        token: json["token"],
    );
}


class ResponseModel {
    bool success;
    int statusCode;
    String message;
    Data data;

    ResponseModel({
        required this.success,
        required this.statusCode,
        required this.message,
        required this.data,
    });

    factory ResponseModel.fromJson(Map<String, dynamic> json) {
        return ResponseModel(
            success: json['success'],
            statusCode: json['statusCode'],
            message: json['message'],
            data: Data.fromJson(json['data']),
        );
    }
}

class Data {
    String id;
    String username;
    String email;
    String createdAt;
    String updatedAt;
    int v;
    String token;

    Data({
        required this.id,
        required this.username,
        required this.email,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
        required this.token,
    });

    factory Data.fromJson(Map<String, dynamic> json) {
        return Data(
            id: json['_id'],
            username: json['username'],
            email: json['email'],
            createdAt: json['createdAt'],
            updatedAt: json['updatedAt'],
            v: json['__v'],
            token: json['token'],
        );
    }
}

