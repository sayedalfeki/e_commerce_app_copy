import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flower_app/app/config/base_error/custom_exceptions.dart';
import 'package:flower_app/app/config/base_error/server_error_response.dart';
import 'package:flower_app/app/config/base_response/base_response.dart';
import 'package:flower_app/app/feature/profile/api/profile_api_client.dart';
import 'package:flower_app/app/feature/profile/api/profile_remote_data_source_impl.dart';
import 'package:flower_app/app/feature/profile/data/model/change_password_response.dart';
import 'package:flower_app/app/feature/profile/domain/request/change_password_request.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'profile_remote_data_source_impl_test.mocks.dart';

@GenerateMocks([ProfileApiClient])
void main() {
  late ProfileApiClient profileApiClient;
  late ProfileRemoteDataSourceImpl profileRemoteDataSourceImpl;
  late ChangePasswordRequest changePasswordRequest;

  late ChangePasswordResponse changePasswordResponse;
  setUpAll(() {
    profileApiClient = MockProfileApiClient();
    profileRemoteDataSourceImpl = ProfileRemoteDataSourceImpl(profileApiClient);

    changePasswordRequest = ChangePasswordRequest(
      password: '123',
      newPassword: '123',
    );
    changePasswordResponse = ChangePasswordResponse();
  });
  test(
    'when calling change password and api return success it should return data',
    () async {
      when(
        profileApiClient.changePassword(changePasswordRequest),
      ).thenAnswer((_) async => changePasswordResponse);
      var result =
          await profileRemoteDataSourceImpl.changePassword(
                changePasswordRequest,
              )
              as SuccessResponse<ChangePasswordResponse>;
      expect(result, isA<SuccessResponse<ChangePasswordResponse>>());
      expect(result.data, equals(changePasswordResponse));
    },
  );
  test(
    'when calling reset password and api return error it should return exact error',
    () async {
      final ServerErrorResponse response = ServerErrorResponse(error: "Fail");
      when(profileApiClient.changePassword(changePasswordRequest)).thenThrow(
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
          await profileRemoteDataSourceImpl.changePassword(
                changePasswordRequest,
              )
              as ErrorResponse<ChangePasswordResponse>;
      expect(result, isA<ErrorResponse<ChangePasswordResponse>>());
      expect(result.error, equals(ServerError(message: response.error)));
    },
  );
}
