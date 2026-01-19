import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flower_app/app/config/base_error/custom_exceptions.dart';
import 'package:flower_app/app/config/base_error/server_error_response.dart';
import 'package:flower_app/app/config/base_response/base_response.dart';
import 'package:flower_app/app/feature/auth/data/model/auth_response.dart';
import 'package:flower_app/app/feature/profile/api/profile_api_client.dart';
import 'package:flower_app/app/feature/profile/api/profile_remote_data_source_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'profile_remote_data_source_impl_test.mocks.dart';

@GenerateMocks([ProfileApiClient])
void main() {
  late ProfileApiClient profileApiClient;
  late ProfileRemoteDataSourceImpl profileRemoteDataSourceImpl;
  late AuthDto authDto;
  setUpAll(() {
    profileApiClient = MockProfileApiClient();
    profileRemoteDataSourceImpl = ProfileRemoteDataSourceImpl(profileApiClient);

    authDto = AuthDto(
      message: 'success',
      user: User(email: 's@yahoo.com'),
    );
  });
  test(
    'when calling get profile and api return success it should return data',
    () async {
      when(profileApiClient.getProfile()).thenAnswer((_) async => authDto);
      var result =
          await profileRemoteDataSourceImpl.getProfile()
              as SuccessResponse<AuthDto>;
      expect(result, isA<SuccessResponse<AuthDto>>());
      expect(result.data, equals(authDto));
      expect(result.data.user?.email, equals('s@yahoo.com'));
    },
  );
  test(
    'when calling getProfile and api return error it should return exact error',
    () async {
      final ServerErrorResponse response = ServerErrorResponse(error: "Fail");
      when(profileApiClient.getProfile()).thenThrow(
        DioException(
          requestOptions: RequestOptions(),
          type: DioExceptionType.badResponse,
          response: Response(
            requestOptions: RequestOptions(),
            data: jsonEncode(response.toJson()),
          ),
        ),
      );
      var result =
          await profileRemoteDataSourceImpl.getProfile()
              as ErrorResponse<AuthDto>;
      expect(result, isA<ErrorResponse<AuthDto>>());
      expect(result.error, equals(ServerError(message: response.error)));
    },
  );
}
