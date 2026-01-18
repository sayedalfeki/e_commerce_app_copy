import 'package:flower_app/app/config/api_utils/api_utils.dart';
import 'package:flower_app/app/config/base_response/base_response.dart';
import 'package:flower_app/app/feature/signup/api/api_client/api_client.dart';
import 'package:flower_app/app/feature/signup/data/data_sources/signup_remote_data_source_contract.dart';
import 'package:flower_app/app/feature/signup/data/models/signup_dto.dart';
import 'package:injectable/injectable.dart';

@Injectable(as:SignupRemoteDataSourceContract)
class SignupRemoteDataSourceImpl implements SignupRemoteDataSourceContract {
  SignupApiClient signupApiClient;
  SignupRemoteDataSourceImpl(this.signupApiClient);

  @override
  Future<BaseResponse<SignupDto>> register(String gender,String firstName, String lastName, String email, String password, String rePassword, String phone) async{
    return await executeApi(() =>
        signupApiClient.register({
          "firstName": firstName,
          "lastName": lastName,
          "email": email,
          "password": password,
          "rePassword": rePassword,
          "phone": phone,
          "gender": gender
        })
    );
    try {

    } catch (e) {
      return ErrorResponse<SignupDto>(error: e as Exception);
    }
  }
}