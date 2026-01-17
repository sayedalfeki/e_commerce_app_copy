import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:flower_app/app/config/base_response/base_response.dart';
import 'package:flower_app/app/feature/auth/data/datasource/remote/remote_datasource_contract.dart';
import 'package:flower_app/app/feature/auth/data/model/auth_response.dart';
import 'package:flower_app/app/feature/auth/data/repo/auth_repo_impl.dart';
import 'package:flower_app/app/feature/auth/domain/model/auth_model.dart';

import 'auth_repo_impl_test.mocks.dart';

@GenerateMocks([AuthRemoteDatasourceContract])
void main() {
  provideDummy<BaseResponse<AuthDto>>(
    SuccessResponse<AuthDto>(data: AuthDto(message: 'dummy')),
  );

  late AuthRepoImpl authRepoImpl;
  late MockAuthRemoteDatasourceContract mockRemoteDatasource;

  setUp(() {
    mockRemoteDatasource = MockAuthRemoteDatasourceContract();
    authRepoImpl = AuthRepoImpl(mockRemoteDatasource);
  });

  group('AuthRepoImpl.login', () {
    test('returns SuccessResponse<AuthModel> on success', () async {
      // Arrange
      when(mockRemoteDatasource.login('email', 'password')).thenAnswer(
        (_) async => SuccessResponse<AuthDto>(
          data: AuthDto(message: 'Login Successful', token: 'sample_token'),
        ),
      );

      // Act
      final result = await authRepoImpl.login('email', 'password');

      // Assert
      expect(result, isA<SuccessResponse<AuthModel>>());

      verify(mockRemoteDatasource.login('email', 'password')).called(1);
      verifyNoMoreInteractions(mockRemoteDatasource);
    });

    test('returns ErrorResponse<AuthModel> on failure', () async {
      // Arrange
      when(mockRemoteDatasource.login('email', 'password')).thenAnswer(
        (_) async => ErrorResponse<AuthDto>(error: Exception('Login Failed')),
      );

      // Act
      final result = await authRepoImpl.login('email', 'password');

      // Assert
      expect(result, isA<ErrorResponse<AuthModel>>());
      verify(mockRemoteDatasource.login('email', 'password')).called(1);
      verifyNoMoreInteractions(mockRemoteDatasource);
    });
  });
}
