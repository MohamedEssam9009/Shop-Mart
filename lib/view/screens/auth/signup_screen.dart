import '../../../logic/controllers/auth_controller.dart';
import '../../../routes/routes.dart';
import '../../../utils/theme.dart';
import '../../widgets/auth/auth_button.dart';
import '../../widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/my_string.dart';
import '../../widgets/auth/auth_text_form_field.dart';
import '../../widgets/auth/check_widget.dart';
import '../../widgets/auth/container_under.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
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
                              text: 'SIGN',
                              color: Get.isDarkMode ? pinkClr : mainColor,
                              fontSize: 28.0,
                              fontWeight: FontWeight.w500,
                              underline: TextDecoration.none,
                            ),
                            const SizedBox(width: 3.0),
                            TextUtils(
                              text: 'UP',
                              color:
                                  Get.isDarkMode ? Colors.white : Colors.black,
                              fontSize: 28.0,
                              fontWeight: FontWeight.w500,
                              underline: TextDecoration.none,
                            ),
                          ],
                        ),
                        const SizedBox(height: 50.0),
                        AuthTextFormField(
                          controller: nameController,
                          obscureText: false,
                          validator: (value) {
                            if (value.toString().length <= 2 ||
                                !RegExp(validationName).hasMatch(value)) {
                              return 'Enter valid name';
                            } else {
                              return null;
                            }
                          },
                          prefixIcon: Get.isDarkMode
                              ? Image.asset('assets/images/user.png')
                              : const Icon(
                                  Icons.person,
                                  color: pinkClr,
                                  size: 30.0,
                                ),
                          suffixIcon: const Text(''),
                          hintText: 'User Name',
                        ),
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
                              ? Image.asset('assets/images/email.png')
                              : const Icon(
                                  Icons.email,
                                  color: pinkClr,
                                  size: 30.0,
                                ),
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
                                  ? Image.asset('assets/images/lock.png')
                                  : const Icon(
                                      Icons.lock,
                                      color: pinkClr,
                                      size: 30.0,
                                    ),
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
                        const SizedBox(height: 50.0),
                        CheckWidget(),
                        const SizedBox(height: 50.0),
                        GetBuilder<AuthController>(
                          builder: (_) {
                            return AuthButton(
                              text: 'SIGN UP',
                              onPressed: () {
                                if (controller.isCheckedBox == false) {
                                  Get.snackbar(
                                    'Check Box',
                                    'Please, Accept Terms & Conditions',
                                    snackPosition: SnackPosition.BOTTOM,
                                    backgroundColor: Colors.green,
                                    colorText: Colors.white,
                                  );
                                } else if (formKey.currentState!.validate()) {
                                  String name = nameController.text.trim();
                                  String email = emailController.text;
                                  String password =
                                      passwordController.text.trim();
                                  controller.signUpUsingFirebase(
                                    name: name,
                                    email: email,
                                    password: password,
                                  );
                                  controller.isCheckedBox = true;
                                }
                              },
                            );
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
              ContainerUnder(
                text: 'Already have an account? ',
                onPressed: () {
                  Get.offNamed(Routes.loginScreen);
                },
                textType: 'Log In',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
