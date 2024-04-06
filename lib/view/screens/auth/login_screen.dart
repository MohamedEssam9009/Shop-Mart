import '../../../routes/routes.dart';
import '../../../utils/my_string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../logic/controllers/auth_controller.dart';
import '../../../utils/theme.dart';
import '../../widgets/auth/auth_button.dart';
import '../../widgets/auth/auth_text_form_field.dart';
import '../../widgets/auth/container_under.dart';
import '../../widgets/text_utils.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.scaffoldBackgroundColor,
        appBar: AppBar(
          backgroundColor: Get.isDarkMode ? darkGreyClr : Colors.white,
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 1.3,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 25.0,
                    right: 25.0,
                    top: 40.0,
                  ),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            TextUtils(
                              text: 'LOG',
                              color: Get.isDarkMode ? pinkClr : mainColor,
                              fontSize: 28.0,
                              fontWeight: FontWeight.w500,
                              underline: TextDecoration.none,
                            ),
                            const SizedBox(width: 3.0),
                            TextUtils(
                              text: 'IN',
                              color:
                                  Get.isDarkMode ? Colors.white : Colors.black,
                              fontSize: 28.0,
                              fontWeight: FontWeight.w500,
                              underline: TextDecoration.none,
                            ),
                          ],
                        ),
                        const SizedBox(height: 50.0),
                        const SizedBox(height: 20.0),
                        AuthTextFormField(
                          controller: emailController,
                          obscureText: false,
                          validator: (value) {
                            if (!RegExp(validationEmail).hasMatch(value)) {
                              return 'Enter valid email';
                            } else {
                              return null;
                            }
                          },
                          prefixIcon: Get.isDarkMode
                              ? const Icon(
                                  Icons.email,
                                  color: pinkClr,
                                  size: 30.0,
                                )
                              : Image.asset('assets/images/email.png'),
                          suffixIcon: const Text(''),
                          hintText: 'Email',
                        ),
                        const SizedBox(height: 20.0),
                        GetBuilder<AuthController>(
                          builder: (_) {
                            return AuthTextFormField(
                              controller: passwordController,
                              obscureText:
                                  controller.isVisibility ? false : true,
                              validator: (value) {
                                if (value.toString().length < 6) {
                                  return 'Password should be longer or equal to 6 characters';
                                } else {
                                  return null;
                                }
                              },
                              prefixIcon: Get.isDarkMode
                                  ? const Icon(
                                      Icons.lock,
                                      color: pinkClr,
                                      size: 30.0,
                                    )
                                  : Image.asset('assets/images/lock.png'),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  controller.visibility();
                                },
                                icon: controller.isVisibility
                                    ? const Icon(
                                        Icons.visibility_off,
                                        color: Colors.black,
                                      )
                                    : const Icon(
                                        Icons.visibility,
                                        color: Colors.black,
                                      ),
                              ),
                              hintText: 'Password',
                            );
                          },
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              Get.toNamed(Routes.forgotPasswordScreen);
                            },
                            child: TextUtils(
                              text: 'Forget password?',
                              color:
                                  Get.isDarkMode ? Colors.white : Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              underline: TextDecoration.none,
                            ),
                          ),
                        ),
                        const SizedBox(height: 50.0),
                        GetBuilder<AuthController>(
                          builder: (_) {
                            return AuthButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  String email = emailController.text.trim();
                                  String password = passwordController.text;
                                  controller.logInUsingFirebase(
                                    email: email,
                                    password: password,
                                  );
                                }
                              },
                              text: 'LOG IN',
                            );
                          },
                        ),
                        const SizedBox(height: 20.0),
                        TextUtils(
                          text: 'OR',
                          color: Get.isDarkMode ? Colors.white : Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          underline: TextDecoration.none,
                        ),
                        const SizedBox(height: 20.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GetBuilder<AuthController>(
                              builder: (_) {
                                return InkWell(
                                  onTap: () {
                                   //controller.facebookSignUpApp();
                                  },
                                  child:
                                      Image.asset('assets/images/facebook.png'),
                                );
                              },
                            ),
                            const SizedBox(width: 10.0),
                            GetBuilder<AuthController>(
                              builder: (_) {
                                return InkWell(
                                  onTap: () {
                                    controller.googleSignUpApp();
                                  },
                                  child:
                                      Image.asset('assets/images/google.png'),
                                );
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              ContainerUnder(
                text: 'Don\'t have an account?',
                onPressed: () {
                  Get.offNamed(Routes.signUpScreen);
                },
                textType: 'Sign Up',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
