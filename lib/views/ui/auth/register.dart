import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_shop/controllers/login_provider.dart';
import 'package:online_shop/models/auth/signup_model.dart';
import 'package:online_shop/views/shared/app_constants.dart';
import 'package:online_shop/views/shared/appstyle.dart';
import 'package:online_shop/views/shared/custom_textfield.dart';
import 'package:online_shop/views/shared/reusable_text.dart';
import 'package:online_shop/views/ui/auth/login.dart';
import 'package:provider/provider.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController username = TextEditingController();

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginNotifier>(
      builder: (context, authNotifier, child) {
        return Scaffold(
            appBar: AppBar(
              toolbarHeight: 50,
              backgroundColor: Colors.black,
            ),
            backgroundColor: Colors.black,
            body: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 60.h),
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      opacity: 0.5, image: AssetImage("assets/images/bg.jpg"))),
              child: Form(
                // key: authNotifier.loginFormKey,
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    ReusableText(
                        text: "Welcome!",
                        style:
                            appstyle(30, Color(kLight.value), FontWeight.w600)),
                    ReusableText(
                        text: "Fill these details to login you account",
                        style: appstyle(
                            16, Color(kLight.value), FontWeight.normal)),
                    const SizedBox(height: 50),
                    CustomTextField(
                        keyboard: TextInputType.emailAddress,
                        hintText: "Username",
                        controller: username,
                        validator: (username) {
                          if (username!.isEmpty) {
                            return "Please enter a valid username";
                          } else {
                            return null;
                          }
                        }),
                    const SizedBox(height: 20),
                    CustomTextField(
                        keyboard: TextInputType.emailAddress,
                        hintText: "Email",
                        controller: email,
                        validator: (email) {
                          if (email!.isEmpty || !email.contains("@")) {
                            return "Please enter a valid email address";
                          } else {
                            return null;
                          }
                        }),
                    const SizedBox(height: 20),
                    CustomTextField(
                        keyboard: TextInputType.emailAddress,
                        obscureText: authNotifier.isObsecure,
                        hintText: "Password",
                        controller: password,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            authNotifier.isObsecure = !authNotifier.isObsecure;
                          },
                          child: Icon(
                            authNotifier.isObsecure
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Color(kDark.value),
                          ),
                        ),
                        validator: (password) {
                          if (password!.isEmpty || password.length < 7) {
                            return "Please enter a valid password";
                          } else {
                            return null;
                          }
                        }),
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: ReusableText(
                          text: "Login",
                          style: appstyle(
                              14, Color(kLight.value), FontWeight.w500),
                        ),
                      ),
                    ),
                    const SizedBox(height: 50),
                    GestureDetector(
                      onTap: () {
                        SignupModel model = SignupModel(
                          email: email.text,
                          password: password.text,
                          username: username.text,
                        );

                        authNotifier.registerUser(model).then((response) {
                          print("Registration Response: ${response}");
                          print("Username: ${username.text}");
                          print("Email: ${email.text}");
                          print("Password: ${password.text}");

                          if (response == true) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginPage(),
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: ReusableText(
                                    text: "Registration Failed",
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white)),
                                backgroundColor: Colors.red,
                              ),
                            );
                          }
                        });
                      },
                      child: Container(
                        height: 60,
                        width: width * 0.8,
                        decoration: BoxDecoration(
                            color: Color(kLight.value),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(12))),
                        child: Center(
                            child: authNotifier.processing
                                ? const CircularProgressIndicator.adaptive()
                                : ReusableText(
                                    text: "S I G N U P",
                                    style: appstyle(
                                        18, Colors.black, FontWeight.bold))),
                      ),
                    )
                  ],
                ),
              ),
            ));
      },
    );
  }
}
