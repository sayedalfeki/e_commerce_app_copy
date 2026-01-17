import 'package:flower_app/app/feature/home/presentation/views/tabs/home_tab/data/models/best_seller_dto.dart';
import 'package:flower_app/app/feature/home/presentation/views/tabs/home_tab/data/models/category_dto.dart';
import 'package:flower_app/app/feature/home/presentation/views/tabs/home_tab/data/models/occasion_dto.dart';
import 'package:flower_app/app/feature/home/presentation/views/tabs/home_tab/domain/models/get_home_tab_response_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_home_tab_response.g.dart';
@JsonSerializable()
class GetHomeTabResponse {
    @JsonKey(name: "message")
    String? message;
    @JsonKey(name: "products")
    List<BestSellerDTO>? products;
    @JsonKey(name: "categories")
    List<CategoryDTO>? categories;
    @JsonKey(name: "bestSeller")
    List<BestSellerDTO>? bestSeller;
    @JsonKey(name: "occasions")
    List<OccasionDTO>? occasions;

    GetHomeTabResponse({
        this.message,
        this.products,
        this.categories,
        this.bestSeller,
        this.occasions,
    });

    factory GetHomeTabResponse.fromJson(Map<String, dynamic> json) => _$GetHomeTabResponseFromJson(json);

    Map<String, dynamic> toJson() => _$GetHomeTabResponseToJson(this);
    GetHomeTabResponseModel toDomain(){
      return GetHomeTabResponseModel(
        categories: categories?.map((e) => e.toDomain(),).toList(),
        bestSellers: bestSeller?.map((e) => e.toDomain(),).toList(),
        occasions: occasions?.map((e) => e.toDomain(),).toList()
      );
    }
}