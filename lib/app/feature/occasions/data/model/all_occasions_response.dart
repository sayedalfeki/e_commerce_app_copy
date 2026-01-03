import 'package:flower_app/app/core/model/meta_data/meta_data_dto.dart';
import 'package:flower_app/app/feature/occasions/domain/model/all_occasions_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'all_occasions_response.g.dart';

@JsonSerializable()
class AllOccasionResponse {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "metadata")
  final MetadataDto? metadata;
  @JsonKey(name: "occasions")
  final List<OccasionsDto>? occasions;

  AllOccasionResponse({this.message, this.metadata, this.occasions});

  factory AllOccasionResponse.fromJson(Map<String, dynamic> json) {
    return _$AllOccasionResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AllOccasionResponseToJson(this);
  }

  AllOccasionsEntity toAllOccasionsEntity() {
    List<OccasionEntity>? allOccasions = [];
    allOccasions = List.generate(occasions!.length, (index) {
      return OccasionEntity(
          id: occasions?[index].Id ?? '', title: occasions?[index].name ?? '');
    });
    return AllOccasionsEntity(occasionsEntity: allOccasions);
  }
}

@JsonSerializable()
class OccasionsDto {
  @JsonKey(name: "_id")
  final String? Id;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "slug")
  final String? slug;
  @JsonKey(name: "image")
  final String? image;
  @JsonKey(name: "createdAt")
  final String? createdAt;
  @JsonKey(name: "updatedAt")
  final String? updatedAt;
  @JsonKey(name: "isSuperAdmin")
  final bool? isSuperAdmin;
  @JsonKey(name: "productsCount")
  final int? productsCount;

  OccasionsDto({
    this.Id,
    this.name,
    this.slug,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.isSuperAdmin,
    this.productsCount,
  });

  factory OccasionsDto.fromJson(Map<String, dynamic> json) {
    return _$OccasionsDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$OccasionsDtoToJson(this);
  }
}
