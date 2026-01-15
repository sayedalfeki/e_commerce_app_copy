
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
    try {
      SignupDto signupResponse = await signupApiClient.register({
        
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "password": password,
        "rePassword": rePassword,
        "phone": phone,
        "gender":gender
      });
      return SuccessResponse<SignupDto>(data: signupResponse);
    } catch (e) {
      return ErrorResponse<SignupDto>(error: e as Exception);
    }
  }
}