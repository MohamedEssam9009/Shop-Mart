import 'package:asroo_shop/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';

class DeliveryContainerWidget extends StatefulWidget {
  const DeliveryContainerWidget({super.key});

  @override
  State<DeliveryContainerWidget> createState() =>
      _DeliveryContainerWidgetState();
}

class _DeliveryContainerWidgetState extends State<DeliveryContainerWidget> {
  int radioContainerIndex = 1;
  bool changeColor = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildRadioContainer(
          address: 'Sohag , ',
          name: 'asroo store',
          phone: '+201019664820',
          title: 'asroo shop',
          value: 1,
          color: changeColor ? Colors.white : Colors.grey.shade300,
          onChanged: (int? value) {
            setState(() {
              radioContainerIndex = value!;
              changeColor = !changeColor;
            });
          },
        ),
        const SizedBox(height: 10.0),
        buildRadioContainer(
          address: 'Sohag , ',
          name: 'mohamed essam',
          phone: '+201019664820',
          title: 'asroo shop',
          value: 2,
          color: changeColor ? Colors.grey.shade300 : Colors.white,
          onChanged: (int? value) {
            setState(() {
              radioContainerIndex = value!;
              changeColor = !changeColor;
            });
          },
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
                TextUtils(
                  text: phone,
                  color: Colors.black,
                  fontSize: 15.0,
                  fontWeight: FontWeight.normal,
                  underline: TextDecoration.none,
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
