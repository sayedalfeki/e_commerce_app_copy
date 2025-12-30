import 'package:flower_app/app/config/base_response/base_response.dart';
import 'package:flower_app/app/feature/auth/api/api_auth/api_auth.dart';
import 'package:flower_app/app/feature/auth/data/datasource/remote/remote_datasource_contract.dart';
import 'package:flower_app/app/feature/auth/data/model/auth_response.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRemoteDatasourceContract)
class AuthRemoteDatasourceImpl implements AuthRemoteDatasourceContract {
  final AuthApiClient apiClient;

  AuthRemoteDatasourceImpl(this.apiClient);

  @override
  Future<BaseResponse<AuthDto>> login(String email, String password) async {
    try {
      final response = await apiClient.login({
        'email': email,
        'password': password,
      });

      return SuccessResponse<AuthDto>(data: response);
    } on Exception catch (e) {
      return ErrorResponse<AuthDto>(error: e);
    }
  }
}
