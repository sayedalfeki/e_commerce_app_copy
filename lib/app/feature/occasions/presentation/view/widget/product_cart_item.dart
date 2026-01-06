import 'package:flutter/material.dart';

import '../../../domain/model/products_occasion_entity.dart';

class ProductCartItem extends StatelessWidget {
  const ProductCartItem({super.key, required this.productOccasionEntity});

  final ProductOccasionEntity? productOccasionEntity;

  @override
  Widget build(BuildContext context) {
    double discount =
        productOccasionEntity?.price != null &&
            productOccasionEntity?.priceAfterDiscount != null
        ? (productOccasionEntity!.price! /
                  productOccasionEntity!.priceAfterDiscount!.toInt()) *
              100
        : 0;
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
              child: productOccasionEntity == null
                  ? Icon(Icons.not_interested)
                  : Image.network(
                      productOccasionEntity?.imgCover ?? '',
                      fit: BoxFit.cover,
              ),
            ),
          ),
          Text(productOccasionEntity?.title ?? ''),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('EGP'),
              Text('${productOccasionEntity?.priceAfterDiscount ?? 0}'),
              Text(
                '${productOccasionEntity?.price ?? 0}',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  decoration: TextDecoration.lineThrough,
                ),
              ),
              Text('${discount.toInt()}%'),
            ],
          ),
          productOccasionEntity != null
              ? ElevatedButton(
                  onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.shopping_cart),
                SizedBox(width: 8),
                Text('Add to cart'),
              ],
            ),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
