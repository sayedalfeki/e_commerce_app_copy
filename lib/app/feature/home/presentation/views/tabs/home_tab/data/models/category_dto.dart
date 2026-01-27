import 'package:flower_app/app/feature/home/presentation/views/tabs/home_tab/domain/models/category_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'category_dto.g.dart';
@JsonSerializable()
class CategoryDTO {
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

    CategoryDTO({
        this.id,
        this.name,
        this.slug,
        this.image,
        this.createdAt,
        this.updatedAt,
        this.isSuperAdmin,
    });

    factory CategoryDTO.fromJson(Map<String, dynamic> json) => _$CategoryDTOFromJson(json);

    Map<String, dynamic> toJson() => _$CategoryDTOToJson(this);
    CategoryModel toDomain(){
      return CategoryModel(
        id: id,
        name: name,
        image: image
      );
    }
}