// This file is "main.dart"
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

// required: associates our `main.dart` with the code generated by Freezed
part 'size.freezed.dart';
// optional: Since our Person class is serializable, we must add this line.
// But if Person was not serializable, we could skip it.
part 'size.g.dart';

@freezed
class Size with _$Size {


  const factory Size({
    required String? id,
    required String? size,
    required bool? isSelected,
  }) = _Size;

  factory Size.fromJson(Map<String, Object?> json)
  => _$SizeFromJson(json);
}