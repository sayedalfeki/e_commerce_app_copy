import 'package:flower_app/app/feature/best_seller/data/models/best_seller_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'best_seller_response.g.dart';



@JsonSerializable()
class BestSellerResponse {
    @JsonKey(name: "message")
    String? message;
    @JsonKey(name: "bestSeller")
    List<BestSellerDTO>? bestSeller;

    BestSellerResponse({
        this.message,
        this.bestSeller,
    });

    factory BestSellerResponse.fromJson(Map<String, dynamic> json) => _$BestSellerResponseFromJson(json);

    Map<String, dynamic> toJson() => _$BestSellerResponseToJson(this);
}