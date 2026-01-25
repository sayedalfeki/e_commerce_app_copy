class ProductModel {
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

  ProductModel({
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

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['_id'] ?? '',
      title: json['title'] ?? '',
      slug: json['slug'] ?? '',
      description: json['description'] ?? '',
      imgCover: json['imgCover'] ?? '',
      images: List<String>.from(json['images'] ?? []),
      price: (json['price'] ?? 0).toDouble(),
      priceAfterDiscount: (json['priceAfterDiscount'] ?? 0).toDouble(),
      quantity: json['quantity'] ?? 0,
      category: json['category'] ?? '',
      occasion: json['occasion'] ?? '',
      sold: json['sold'] ?? 0,
      rateAvg: (json['rateAvg'] ?? 0).toDouble(),
      rateCount: json['rateCount'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'title': title,
      'slug': slug,
      'description': description,
      'imgCover': imgCover,
      'images': images,
      'price': price,
      'priceAfterDiscount': priceAfterDiscount,
      'quantity': quantity,
      'category': category,
      'occasion': occasion,
      'sold': sold,
      'rateAvg': rateAvg,
      'rateCount': rateCount,
    };
  }

  int get discountPercentage {
    if (price == 0) return 0;
    return (((price - priceAfterDiscount) / price) * 100).round();
  }
}
