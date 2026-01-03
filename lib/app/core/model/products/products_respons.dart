import 'package:flower_app/app/core/model/meta_data/meta_data_dto.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../feature/occasions/domain/model/products_occasion_entity.dart';
import '../product/product_dto.dart';

part 'products_respons.g.dart';

@JsonSerializable()
class ProductsResponse {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "metadata")
  final MetadataDto? metadata;
  @JsonKey(name: "products")
  final List<ProductDto>? products;

  ProductsResponse({this.message, this.metadata, this.products});

  factory ProductsResponse.fromJson(Map<String, dynamic> json) {
    return _$ProductsResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ProductsResponseToJson(this);
  }

  ProductsOccasionEntity toProductsOccasionEntity() {
    List<ProductOccasionEntity>? productsEntity = products?.map((e) {
      return ProductOccasionEntity(
        imgCover: e.imgCover,
        title: e.title,
        price: e.price,
        priceAfterDiscount: e.priceAfterDiscount,
      );
    }).toList();
    return ProductsOccasionEntity(product: productsEntity);
  }
}
