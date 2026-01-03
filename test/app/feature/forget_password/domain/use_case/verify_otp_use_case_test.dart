import 'package:flower_app/app/config/base_response/base_response.dart';
import 'package:flower_app/app/feature/forget_password/data/model/verify_otp_response.dart';
import 'package:flower_app/app/feature/forget_password/domain/forget_password_repo_contract.dart';
import 'package:flower_app/app/feature/forget_password/domain/request/verify_otp_request.dart';
import 'package:flower_app/app/feature/forget_password/domain/use_case/verify_otp_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'forget_password_use_case_test.mocks.dart';

void main() {
  late ForgetPasswordRepoContract forgetPasswordRepo;
  late VerifyOtpUseCase verifyOtpUseCase;
  late VerifyOtpRequest verifyOtpRequest;
  late VerifyOtpResponse verifyOtpResponse;

  setUpAll(() {
    forgetPasswordRepo = MockForgetPasswordRepoContract();
    verifyOtpUseCase = VerifyOtpUseCase(forgetPasswordRepo);
    verifyOtpRequest = VerifyOtpRequest(resetCode: 'otp');
    verifyOtpResponse = VerifyOtpResponse();
  });

  test('when calling verify otp it should get data from datasource', () async {
    provideDummy<BaseResponse<VerifyOtpResponse>>(
      SuccessResponse(data: verifyOtpResponse),
    );
    when(
      forgetPasswordRepo.verifyOtp(verifyOtpRequest),
    ).thenAnswer((_) => Future.value(SuccessResponse(data: verifyOtpResponse)));
    var result = await verifyOtpUseCase.invoke(verifyOtpRequest);
    expect(result, isA<SuccessResponse<VerifyOtpResponse>>());
    verify(forgetPasswordRepo.verifyOtp(verifyOtpRequest));
  });
}
