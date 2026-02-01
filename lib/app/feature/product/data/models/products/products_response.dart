import 'package:flower_app/app/core/model/meta_data/meta_data_dto.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../domain/models/products_entity.dart';
import '../product/product_dto.dart';

part 'products_response.g.dart';

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

  ProductsEntity toProductsEntity() {
    List<ProductEntity>? productsEntity = products?.map((e) {
      return ProductEntity(
        imgCover: e.imgCover,
        title: e.title,
        price: e.price,
        priceAfterDiscount: e.priceAfterDiscount,
        id: e.id,
      );
    }).toList();
    return ProductsEntity(product: productsEntity);
  }
}
