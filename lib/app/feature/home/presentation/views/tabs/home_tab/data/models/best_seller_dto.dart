import 'package:flower_app/app/feature/home/presentation/views/tabs/home_tab/domain/models/best_seller_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'best_seller_dto.g.dart';
@JsonSerializable()
class BestSellerDTO {
    @JsonKey(name: "_id")
    String? id;
    @JsonKey(name: "title")
    String? title;
    @JsonKey(name: "slug")
    String? slug;
    @JsonKey(name: "description")
    String? description;
    @JsonKey(name: "imgCover")
    String? imgCover;
    @JsonKey(name: "images")
    List<String>? images;
    @JsonKey(name: "price")
    int? price;
    @JsonKey(name: "priceAfterDiscount")
    int? priceAfterDiscount;
    @JsonKey(name: "quantity")
    int? quantity;
    @JsonKey(name: "category")
    String? category;
    @JsonKey(name: "occasion")
    String? occasion;
    @JsonKey(name: "createdAt")
    DateTime? createdAt;
    @JsonKey(name: "updatedAt")
    DateTime? updatedAt;
    @JsonKey(name: "__v")
    int? v;
    @JsonKey(name: "isSuperAdmin")
    bool? isSuperAdmin;
    @JsonKey(name: "sold")
    int? sold;
    @JsonKey(name: "rateAvg")
    int? rateAvg;
    @JsonKey(name: "rateCount")
    int? rateCount;
    @JsonKey(name: "id")
    String? bestSellerId;
    @JsonKey(name: "discount")
    int? discount;

    BestSellerDTO({
        this.id,
        this.title,
        this.slug,
        this.description,
        this.imgCover,
        this.images,
        this.price,
        this.priceAfterDiscount,
        this.quantity,
        this.category,
        this.occasion,
        this.createdAt,
        this.updatedAt,
        this.v,
        this.isSuperAdmin,
        this.sold,
        this.rateAvg,
        this.rateCount,
        this.bestSellerId,
        this.discount,
    });

    factory BestSellerDTO.fromJson(Map<String, dynamic> json) => _$BestSellerDTOFromJson(json);

    Map<String, dynamic> toJson() => _$BestSellerDTOToJson(this);
    BestSellerModel toDomain(){
      return BestSellerModel(
        id: id,
        title: title,
        imgCover: imgCover,
        price: price,
        images: images
      );
    }
}