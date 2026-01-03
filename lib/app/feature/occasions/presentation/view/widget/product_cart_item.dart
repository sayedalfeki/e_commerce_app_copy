import 'package:flower_app/app/core/resources/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../domain/model/products_occasion_entity.dart';

class ProductCartItem extends StatelessWidget {
  const ProductCartItem({super.key, required this.productOccasionEntity});

  final ProductOccasionEntity productOccasionEntity;

  @override
  Widget build(BuildContext context) {
    double discount =
        (productOccasionEntity.price! /
            productOccasionEntity.priceAfterDiscount!.toInt()) *
        100;
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Image.network(
                productOccasionEntity.imgCover ?? '',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(productOccasionEntity.title ?? ''),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('EGP'),
              Text('${productOccasionEntity.priceAfterDiscount}'),
              Text(
                '${productOccasionEntity.price}',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  decoration: TextDecoration.lineThrough,
                ),
              ),
              Text('${discount.toInt()}%'),
            ],
          ),
          ElevatedButton(
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.shopping_cart),
                SizedBox(width: 8),
                Text('Add to cart'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
