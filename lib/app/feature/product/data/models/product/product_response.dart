import 'package:flower_app/app/feature/product/data/models/product/product_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_response.g.dart';

@JsonSerializable()
class ProductResponse {
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "product")
  ProductDto? product;

  ProductResponse({this.message, this.product});

  factory ProductResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProductResponseToJson(this);
}
