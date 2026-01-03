class ProductsOccasionEntity {
  final List<ProductOccasionEntity>? product;

  ProductsOccasionEntity({this.product});
}

class ProductOccasionEntity {
  final String? imgCover;
  final String? title;
  final int? price;
  final int? priceAfterDiscount;

  ProductOccasionEntity({
    this.imgCover,
    this.title,
    this.price,
    this.priceAfterDiscount,
  });
}
