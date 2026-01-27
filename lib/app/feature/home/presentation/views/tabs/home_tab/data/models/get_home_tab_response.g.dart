// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_home_tab_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetHomeTabResponse _$GetHomeTabResponseFromJson(Map<String, dynamic> json) =>
    GetHomeTabResponse(
      message: json['message'] as String?,
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => BestSellerDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => CategoryDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      bestSeller: (json['bestSeller'] as List<dynamic>?)
          ?.map((e) => BestSellerDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      occasions: (json['occasions'] as List<dynamic>?)
          ?.map((e) => OccasionDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetHomeTabResponseToJson(GetHomeTabResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'products': instance.products,
      'categories': instance.categories,
      'bestSeller': instance.bestSeller,
      'occasions': instance.occasions,
    };
