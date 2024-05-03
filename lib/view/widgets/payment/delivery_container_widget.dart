import '../../../logic/controllers/auth_controller.dart';
import '../../../logic/controllers/payment_controller.dart';
import '../../../routes/routes.dart';
import '../../../utils/theme.dart';
import '../text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeliveryContainerWidget extends StatefulWidget {
  const DeliveryContainerWidget({super.key});

  @override
  State<DeliveryContainerWidget> createState() =>
      _DeliveryContainerWidgetState();
}

class _DeliveryContainerWidgetState extends State<DeliveryContainerWidget> {
  final TextEditingController phoneController = TextEditingController();
  int radioContainerIndex = 1;
  bool changeColor = false;

  final controller = Get.find<PaymentController>();
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildRadioContainer(
          address: 'Egypt , Khatem Elmorsaleen - Elharam',
          name: 'CFC building',
          phone: '01019664820',
          title: 'Work',
          value: 1,
          color: changeColor ? Colors.white : Colors.grey.shade300,
          icon: Container(),
          onChanged: (int? value) {
            setState(() {
              radioContainerIndex = value!;
              changeColor = !changeColor;
            });
          },
        ),
        const SizedBox(height: 10.0),
        Obx(
          () => buildRadioContainer(
            address: controller.address.value,
            name:
                authController.capitalize(authController.displayUserName.value),
            phone: controller.phoneNumber.value,
            title: 'Home',
            value: 2,
            color: changeColor ? Colors.grey.shade300 : Colors.white,
            icon: InkWell(
              onTap: () {
                Get.defaultDialog(
                  title: 'Enter your Phone Number',
                  titleStyle: const TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  backgroundColor: Colors.white,
                  radius: 10.0,
                  textCancel: ' Cancel ',
                  cancelTextColor: Colors.black,
                  textConfirm: ' Save ',
                  onCancel: () {
                    Get.toNamed(Routes.paymentScreen);
                  },
                  onConfirm: () {
                    Get.back();
                    controller.phoneNumber.value = phoneController.text;
                  },
                  buttonColor: Get.isDarkMode ? pinkClr : mainColor,
                  content: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextField(
                      controller: phoneController,
                      cursorColor: Colors.black,
                      keyboardType: TextInputType.text,
                      maxLength: 11,
                      onSubmitted: (value) {
                        phoneController.text = value;
                      },
                      decoration: InputDecoration(
                        fillColor: Get.isDarkMode
                            ? pinkClr.withOpacity(0.1)
                            : mainColor.withOpacity(0.2),
                        focusColor: Colors.red,
                        prefixIcon: Icon(
                          Icons.phone,
                          color: Get.isDarkMode ? pinkClr : mainColor,
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            phoneController.clear();
                          },
                          icon: const Icon(
                            Icons.close,
                            color: Colors.black,
                          ),
                        ),
                        hintText: 'Enter Your Phone Number',
                        hintStyle: const TextStyle(
                          color: Colors.black45,
                          fontSize: 12.0,
                          fontWeight: FontWeight.w500,
                        ),
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                );
              },
              child: Icon(
                Icons.contact_phone,
                size: 20.0,
                color: Get.isDarkMode ? pinkClr : mainColor,
              ),
            ),
            onChanged: (int? value) {
              setState(() {
                radioContainerIndex = value!;
                changeColor = !changeColor;
              });
              controller.updatePosition();
            },
          ),
        ),
      ],
    );
  }

  Widget buildRadioContainer({
    required Color color,
    required int value,
    required Function onChanged,
    required String name,
    required String title,
    required String phone,
    required String address,
    required Widget icon,
  }) {
    return Container(
      height: 120.0,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: color,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 3.0,
            blurRadius: 5.0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Radio(
            value: value,
            groupValue: radioContainerIndex,
            onChanged: (int? value) {
              onChanged(value);
            },
            fillColor: MaterialStateColor.resolveWith((states) => Colors.red),
          ),
          const SizedBox(width: 10.0),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextUtils(
                  text: title,
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  underline: TextDecoration.none,
                ),
                const SizedBox(height: 5.0),
                TextUtils(
                  text: name,
                  color: Colors.black,
                  fontSize: 15.0,
                  fontWeight: FontWeight.normal,
                  underline: TextDecoration.none,
                ),
                const SizedBox(height: 5.0),
                Row(
                  children: [
                    const Text('🇪🇬'),
                    TextUtils(
                      text: phone,
                      color: Colors.black,
                      fontSize: 15.0,
                      fontWeight: FontWeight.normal,
                      underline: TextDecoration.none,
                    ),
                    const SizedBox(width: 120.0),
                    SizedBox(
                      child: icon,
                    )
                  ],
                ),
                const SizedBox(height: 5.0),
                TextUtils(
                  text: address,
                  color: Colors.black,
                  fontSize: 15.0,
                  fontWeight: FontWeight.normal,
                  underline: TextDecoration.none,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
