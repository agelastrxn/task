// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:task/constants/app_sizes.dart';
import 'package:task/infrastructure/models/products.dart';

class CustomCardWidget extends StatelessWidget {
  const CustomCardWidget({Key? key, required this.product}) : super(key: key);
  final ProductsModel product;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSizes.defaultPadding),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.appBarRadius),
        ),
        child: Column(
          children: [
            SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.width,
                child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(AppSizes.appBarRadius),
                    ),
                    child: Image.network(product.image, fit: BoxFit.fitWidth))),
            Padding(
              padding: const EdgeInsets.all(AppSizes.defaultPadding),
              child: Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Text(
                      product.title,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      product.price.toString() + " \$",
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
