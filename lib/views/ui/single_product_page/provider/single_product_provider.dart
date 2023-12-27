import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


import '../../../../util/g_storage.dart';

class SignUpNotifier extends ChangeNotifier {
  // new
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

/*
  signUp(SignUpRequest model) {
    setLoading(true);
    if (model.firstName.isEmpty ||
        model.lastName.isEmpty ||
        model.username.isEmpty ||
        model.email.isEmpty ||
        model.phoneNumber.isEmpty ||
        model.password.isEmpty) {
      // exitDialog();
      setLoading(false);
      Get.snackbar('Sign up failed', 'All fields are required',
          colorText: Color(kLight.value),
          backgroundColor: Color(kOrange.value),
          icon: const Icon(Icons.add_alert));

      return;
    } else if (!model.email!.isEmail) {
      setLoading(false);
      Get.snackbar('Sign Up failed', 'Email is not a valid email',
          colorText: Color(kLight.value),
          backgroundColor: Color(kOrange.value),
          icon: const Icon(Icons.add_alert));
      return;
    }
    AuthHelper.signup(model).then((response) {
      log(response.statusCode.toString());

      if (response.statusCode == 201){
        SignupResponse signupResponse = new SignupResponse.fromJson(jsonDecode(response.body));

        AppStorage.mybox.write(AppStorage.email, signupResponse.data?.email);
        setLoading(false);



        Get.to(()=> VerificationScreen());
      } else if (response.statusCode == 400) {
        setLoading(false);

        SignupError signupError = SignupError.fromJson(jsonDecode(response.body));

        String jsonString = jsonEncode(signupError.data);
        // state = SignUpState(SignUpStatus.error, jsonString);
        Get.snackbar('Sign in failed', jsonString,
            colorText: Color(kLight.value),
            backgroundColor: Color(kOrange.value),
            icon: const Icon(Icons.add_alert));
      } else {
        setLoading(false);

        Get.snackbar('Sign in failed', 'Please check your details',
            colorText: Color(kLight.value),
            backgroundColor: Color(kOrange.value),
            icon: const Icon(Icons.add_alert));
      }
    });
  }
*/
}
