class OccasionResponseModel {
  final String message;
  final MetadataModel metadata;
  final List<OccasionModel> occasions;

  OccasionResponseModel({
    required this.message,
    required this.metadata,
    required this.occasions,
  });

  factory OccasionResponseModel.fromJson(Map<String, dynamic> json) {
    return OccasionResponseModel(
      message: json['message'] ?? '',
      metadata: MetadataModel.fromJson(json['metadata'] ?? {}),
      occasions:
          (json['occasions'] as List<dynamic>?)
              ?.map((e) => OccasionModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }
}

class MetadataModel {
  final int currentPage;
  final int limit;
  final int totalPages;
  final int totalItems;

  MetadataModel({
    required this.currentPage,
    required this.limit,
    required this.totalPages,
    required this.totalItems,
  });

  factory MetadataModel.fromJson(Map<String, dynamic> json) {
    return MetadataModel(
      currentPage: json['currentPage'] ?? 1,
      limit: json['limit'] ?? 10,
      totalPages: json['totalPages'] ?? 0,
      totalItems: json['totalItems'] ?? 0,
    );
  }
}

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
