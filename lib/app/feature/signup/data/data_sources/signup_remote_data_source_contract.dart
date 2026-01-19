
import 'package:flower_app/app/config/base_response/base_response.dart';
import 'package:flower_app/app/feature/signup/data/models/signup_dto.dart';

abstract class SignupRemoteDataSourceContract {
  Future<BaseResponse<SignupDto>> register (String gender ,String firstName , String lastName , String email , String password , String rePassword , String phone);
}