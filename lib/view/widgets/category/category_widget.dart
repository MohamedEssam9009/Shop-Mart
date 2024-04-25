import 'package:asroo_shop/view/widgets/category/category_items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Get.to(()=> CategoryItems());
            },
            child: Container(
              height: 150.0,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                image: const DecorationImage(
                  image: NetworkImage(
                    'https://plus.unsplash.com/premium_photo-1680196764069-2c373356fee9?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8bW9uZXl8ZW58MHx8MHx8fDA%3D',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.only(left: 20.0, bottom: 10.0),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'mens',
                    style: TextStyle(
                      backgroundColor: Colors.black38,
                      color: Colors.white,
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(height: 20.0);
        },
        itemCount: 4,
      ),
    );
  }
}
