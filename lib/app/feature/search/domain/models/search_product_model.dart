class SearchProductModel {
  final String id;
  final String title;
  final String slug;
  final String description;
  final String imgCover;
  final List<String> images;
  final double price;
  final double priceAfterDiscount;
  final int quantity;
  final String category;
  final String occasion;
  final int sold;
  final double rateAvg;
  final int rateCount;

  SearchProductModel({
    required this.id,
    required this.title,
    required this.slug,
    required this.description,
    required this.imgCover,
    required this.images,
    required this.price,
    required this.priceAfterDiscount,
    required this.quantity,
    required this.category,
    required this.occasion,
    required this.sold,
    required this.rateAvg,
    required this.rateCount,
  });

  int get discountPercentage {
    if (price == 0) return 0;
    return (((price - priceAfterDiscount) / price) * 100).round();
  }
}
