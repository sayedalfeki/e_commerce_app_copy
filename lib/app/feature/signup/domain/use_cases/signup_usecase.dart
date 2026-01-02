
import 'package:flower_app/app/config/base_response/base_response.dart';
import 'package:flower_app/app/feature/signup/domain/models/signup_model.dart';
import 'package:flower_app/app/feature/signup/domain/repo/signup_repo_contract.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignupUsecase {
  SignupRepoContract repo;
  SignupUsecase(this.repo);

  Future<BaseResponse<SignupModel>> call(String gender,String firstName , String lastName , String email , String password , String rePassword , String phone)async{
    return await repo.register(gender,firstName, lastName, email, password, rePassword, phone);
  }
}