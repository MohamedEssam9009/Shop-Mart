import 'package:asroo_shop/models/product_models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/product_details/clothes_info.dart';
import '../widgets/product_details/image_sliders.dart';

class ProductDetailsScreen extends StatelessWidget {
  final ProductModels productModels;

  const ProductDetailsScreen({super.key, required this.productModels});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.scaffoldBackgroundColor,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImageSliders(imageUrl: productModels.image),
              ClothesInfo(
                title: productModels.title,
                productId: productModels.id,
                rate: productModels.rating.rate,
              ),
              // SizeList(),
              // AddCart(),
            ],
          ),
        ),
      ),
    );
  }
}
