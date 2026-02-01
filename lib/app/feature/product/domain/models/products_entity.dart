class ProductsEntity {
  final List<ProductEntity>? product;

  ProductsEntity({this.product});
}

class ProductEntity {
  final String? id;
  final String? imgCover;
  final String? title;
  final int? price;
  final int? priceAfterDiscount;
  final String? message;
  final String? description;
  final List<String>? images;
  final int? quantity;
  final int? rateAvg;
  final int? rateCount;
  final int? sold;

  ProductEntity({
    this.id,
    this.imgCover,
    this.title,
    this.price,
    this.priceAfterDiscount,
    this.message,
    this.description,
    this.images,
    this.quantity,
    this.rateAvg,
    this.rateCount,
    this.sold,
  });
}
