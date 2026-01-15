import 'package:flower_app/app/config/base_response/base_response.dart';
import 'package:flower_app/app/feature/signup/api/data_source_impls/signup_remote_data_source_impl.dart';
import 'package:flower_app/app/feature/signup/data/models/signup_dto.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'signup_remote_data_source_impl_test.mocks.dart';


@GenerateMocks([SignupRemoteDataSourceImpl])

void main() {
  late SignupRemoteDataSourceImpl signupRemoteDataSourceImpl;
  setUpAll(() {
    signupRemoteDataSourceImpl = MockSignupRemoteDataSourceImpl();
    provideDummy<BaseResponse<SignupDto>>(
      SuccessResponse<SignupDto>(data: SignupDto())
    );
  },);

  group("Test register function test cases", () {
    test("Test Success case with register", ()async{
      SignupDto(message: "success",token: "adsad432312ewqrew",user:User());

      when(signupRemoteDataSourceImpl.register("","","","","","","")).thenAnswer((_) async{
        return await SuccessResponse<SignupDto>(data: SignupDto(message: "success"));
      },);
      var result = await signupRemoteDataSourceImpl.register("","","","","","","");
      expect(result, isA<SuccessResponse<SignupDto>>());
      expect((result as SuccessResponse<SignupDto> ).data.message, isNotEmpty);
    });

    test("Test Error case with register", ()async{
      when(signupRemoteDataSourceImpl.register("","","","","","","")).thenAnswer((_) async{
        return await ErrorResponse<SignupDto>(error: Exception());
      },);
      var result = await signupRemoteDataSourceImpl.register("","","","","","","");
      expect(result, isA<ErrorResponse<SignupDto>>());
      expect((result as ErrorResponse<SignupDto> ).error.toString(), isNotEmpty);
    });
  },);
}