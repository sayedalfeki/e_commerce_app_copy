import 'package:flower_app/app/feature/profile/domain/model/logout_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'logout_dto.g.dart';

@JsonSerializable()
class LogoutDto {
    @JsonKey(name: "error")
    String? error;
    @JsonKey(name: "message")
    String? message;

    LogoutDto({
        this.error,
        this.message,
    });

    LogoutModel toDomain() {
      return LogoutModel(
        message: message,
        error: error,
      );
    }

    factory LogoutDto.fromJson(Map<String, dynamic> json) => _$LogoutDtoFromJson(json);

    Map<String, dynamic> toJson() => _$LogoutDtoToJson(this);
}
