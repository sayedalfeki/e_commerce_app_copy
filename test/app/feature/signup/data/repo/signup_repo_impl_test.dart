import 'package:flower_app/app/config/base_response/base_response.dart';
import 'package:flower_app/app/feature/signup/data/repo/signup_repo_impl.dart';
import 'package:flower_app/app/feature/signup/domain/models/signup_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'signup_repo_impl_test.mocks.dart';

@GenerateMocks([SignupRepoImpl])

void main() {
  late SignupRepoImpl signupRepoImpl;
  setUpAll(() {
    signupRepoImpl = MockSignupRepoImpl();
    provideDummy<BaseResponse<SignupModel>>(
      SuccessResponse<SignupModel>(data: SignupModel(message: "Success"))
    );
  },);


  group("Test register function test cases ", () {
    test("Test Success case with register", ()async{
      SignupModel(message: "Success");

      when(signupRepoImpl.register("","","","","","","")).thenAnswer((_) async{
        return await SuccessResponse<SignupModel>(data: SignupModel(message: "success"));
      },);
      var result = await signupRepoImpl.register("","","","","","","");
      expect(result, isA<SuccessResponse<SignupModel>>());
      expect((result as SuccessResponse<SignupModel> ).data.message, isNotEmpty);
    });

    test("Test Error case with register", ()async{
      when(signupRepoImpl.register("","","","","","","")).thenAnswer((_) async{
        return await ErrorResponse<SignupModel>(error: Exception());
      },);
      var result = await signupRepoImpl.register("","","","","","","");
      expect(result, isA<ErrorResponse<SignupModel>>());
      expect((result as ErrorResponse<SignupModel> ).error.toString(), isNotEmpty);
    });
  },);
  
}