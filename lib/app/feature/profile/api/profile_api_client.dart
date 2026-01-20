import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flower_app/app/feature/profile/domain/request/update_profile_request.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../../core/endpoint/app_endpoint.dart';
import '../../auth/data/model/auth_response.dart';
import '../data/model/profile_photo_response.dart';

part 'profile_api_client.g.dart';

@RestApi(baseUrl: AppEndPoint.baseUrl)
abstract class ProfileApiClient {
  factory ProfileApiClient(Dio dio, {String baseUrl}) = _ProfileApiClient;
  @GET(AppEndPoint.profile)
  Future<AuthDto> getProfile();

  @PUT(AppEndPoint.uploadPhoto)
  Future<ProfilePhotoResponse> uploadPhoto(@Part(name: 'photo') File file);

  @PUT(AppEndPoint.uploadPhoto)
  Future<AuthDto> updateProfile(@Body() UpdateProfileRequest request);
}
