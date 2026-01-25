class OccasionModel {
  final String id;
  final String name;
  final String slug;
  final String image;
  final String createdAt;
  final String updatedAt;
  final bool isSuperAdmin;
  final int productsCount;

  OccasionModel({
    required this.id,
    required this.name,
    required this.slug,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
    required this.isSuperAdmin,
    required this.productsCount,
  });

  factory OccasionModel.fromJson(Map<String, dynamic> json) {
    return OccasionModel(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      slug: json['slug'] ?? '',
      image: json['image'] ?? '',
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
      isSuperAdmin: json['isSuperAdmin'] ?? false,
      productsCount: json['productsCount'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'slug': slug,
      'image': image,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'isSuperAdmin': isSuperAdmin,
      'productsCount': productsCount,
    };
  }
}
