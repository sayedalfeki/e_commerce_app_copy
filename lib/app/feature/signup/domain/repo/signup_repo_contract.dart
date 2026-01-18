
import 'package:flower_app/app/config/base_response/base_response.dart';
import 'package:flower_app/app/feature/signup/domain/models/signup_model.dart';

abstract class SignupRepoContract {
  Future<BaseResponse<SignupModel>> register (String gender ,String firstName , String lastName , String email , String password , String rePassword , String phone);
}