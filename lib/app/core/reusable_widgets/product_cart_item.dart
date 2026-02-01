import 'package:flutter/material.dart';

import '../../feature/product/domain/models/products_entity.dart';

class ProductCartItem extends StatelessWidget {
  const ProductCartItem({super.key, required this.productEntity, this.onTap});

  final ProductEntity? productEntity;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    double discount =
        productEntity?.price != null &&
            productEntity?.priceAfterDiscount != null
        ? (productEntity!.price! / productEntity!.priceAfterDiscount!.toInt()) *
              100
        : 0;
    return InkWell(
      onTap: onTap,
      child: Container(
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
                child: productEntity == null
                    ? Icon(Icons.not_interested)
                    : Image.network(
                        productEntity?.imgCover ?? '',
                        fit: BoxFit.cover,
                      ),
              ),
            ),
            Text(productEntity?.title ?? ''),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('EGP'),
                Text('${productEntity?.priceAfterDiscount ?? 0}'),
                Text(
                  '${productEntity?.price ?? 0}',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
                Text('${discount.toInt()}%'),
              ],
            ),
            productEntity != null
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
      ),
    );
  }
}
