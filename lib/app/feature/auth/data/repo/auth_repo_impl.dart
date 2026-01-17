import 'package:flower_app/app/config/base_response/base_response.dart';
import 'package:flower_app/app/feature/auth/data/datasource/remote/remote_datasource_contract.dart';
import 'package:flower_app/app/feature/auth/data/model/auth_response.dart';
import 'package:flower_app/app/feature/auth/domain/model/auth_model.dart';
import 'package:flower_app/app/feature/auth/domain/repo/auth_repo_contract.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRepoContract)
class AuthRepoImpl implements AuthRepoContract {
  AuthRemoteDatasourceContract authRemoteDatasourceContract;
  AuthRepoImpl(this.authRemoteDatasourceContract);
  @override
  Future<void> getAuthData() {
    // TODO: implement getAuthData
    throw UnimplementedError();
  }

  @override
  Future<BaseResponse<AuthModel>> login(String email, String password) async {
    BaseResponse<AuthDto> response = await authRemoteDatasourceContract.login(
      email,
      password,
    );
    switch (response) {
      case SuccessResponse<AuthDto> successResponse:
        AuthModel authModel = AuthModel(
          massage: successResponse.data.message!,
          tokin: successResponse.data.token,
        );
        return SuccessResponse(data: authModel);
      case ErrorResponse<AuthDto> errorResponse:
        return ErrorResponse(error: errorResponse.error);
    }
  }
}
