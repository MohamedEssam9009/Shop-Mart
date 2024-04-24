import 'package:asroo_shop/logic/controllers/product_controller.dart';
import 'package:asroo_shop/utils/theme.dart';
import 'package:asroo_shop/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

class ClothesInfo extends StatelessWidget {
  final String title;
  final int productId;
  final double rate;
  final String description;

  ClothesInfo({
    super.key,
    required this.title,
    required this.productId,
    required this.rate,
    required this.description,
  });

  final controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
              ),
              Obx(
                () => Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Get.isDarkMode
                        ? Colors.white.withOpacity(0.9)
                        : Colors.grey.withOpacity(0.4),
                    shape: BoxShape.circle,
                  ),
                  child: InkWell(
                    onTap: () {
                      controller.manageFavorite(productId);
                    },
                    child: controller.isFavorite(productId)
                        ? const Icon(
                            Icons.favorite,
                            color: Colors.red,
                            size: 20.0,
                          )
                        : const Icon(
                            Icons.favorite_outline,
                            color: Colors.black,
                            size: 20.0,
                          ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 8.0),
          Row(
            children: [
              TextUtils(
                text: '$rate',
                color: Get.isDarkMode ? Colors.white : Colors.black,
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
                underline: TextDecoration.none,
              ),
              RatingBarIndicator(
                rating: rate,
                itemBuilder: (context, index) {
                  return const Icon(
                    Icons.star,
                    color: Colors.orangeAccent,
                  );
                },
                itemSize: 20.0,
                unratedColor: Colors.grey,
                itemCount: 5,
              ),
            ],
          ),
          const SizedBox(height: 20.0),
          ReadMoreText(
            description,
            trimLines: 3,
            textAlign: TextAlign.justify,
            trimMode: TrimMode.Line,
            trimCollapsedText: 'Show More',
            trimExpandedText: 'Show Less',
            lessStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Get.isDarkMode ? pinkClr : mainColor,
            ),
            moreStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Get.isDarkMode ? pinkClr : mainColor,
            ),
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              height: 2.0,
              color: Get.isDarkMode ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
