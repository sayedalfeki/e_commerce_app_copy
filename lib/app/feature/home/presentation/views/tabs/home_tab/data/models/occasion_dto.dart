import 'package:flower_app/app/feature/home/presentation/views/tabs/home_tab/domain/models/occasion_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'occasion_dto.g.dart';
@JsonSerializable()
class OccasionDTO {
    @JsonKey(name: "_id")
    String? id;
    @JsonKey(name: "name")
    String? name;
    @JsonKey(name: "slug")
    String? slug;
    @JsonKey(name: "image")
    String? image;
    @JsonKey(name: "createdAt")
    DateTime? createdAt;
    @JsonKey(name: "updatedAt")
    DateTime? updatedAt;
    @JsonKey(name: "isSuperAdmin")
    bool? isSuperAdmin;

    OccasionDTO({
        this.id,
        this.name,
        this.slug,
        this.image,
        this.createdAt,
        this.updatedAt,
        this.isSuperAdmin,
    });

    factory OccasionDTO.fromJson(Map<String, dynamic> json) => _$OccasionDTOFromJson(json);

    Map<String, dynamic> toJson() => _$OccasionDTOToJson(this);
    OccasionModel toDomain(){
      return OccasionModel(
        id: id,
        name: name,
        image: image
      );
    }
}