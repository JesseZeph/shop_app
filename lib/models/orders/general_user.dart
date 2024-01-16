// This file is "main.dart"
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:online_shop/models/orders/sneakers.dart';
import 'package:online_shop/models/orders/user.dart';

// required: associates our `main.dart` with the code generated by Freezed
part 'general_user.freezed.dart';
// optional: Since our Person class is serializable, we must add this line.
// But if Person was not serializable, we could skip it.
part 'general_user.g.dart';

@freezed
class GeneralUser with _$GeneralUser {
  const factory GeneralUser({
    required bool? success,
    required int? statusCode,
    required String? message,
    required User data,
  }) = _GeneralUser;



  factory GeneralUser.fromJson(Map<String, Object?> json)
  => _$GeneralUserFromJson(json);
}