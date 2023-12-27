class AddToWaitlistResponse {
  AddToWaitlistResponse({
      this.success, 
      this.statusCode, 
      this.message,});

  AddToWaitlistResponse.fromJson(dynamic json) {
    success = json['success'];
    statusCode = json['statusCode'];
    message = json['message'];
  }
  bool? success;
  int? statusCode;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['statusCode'] = statusCode;
    map['message'] = message;
    return map;
  }

}