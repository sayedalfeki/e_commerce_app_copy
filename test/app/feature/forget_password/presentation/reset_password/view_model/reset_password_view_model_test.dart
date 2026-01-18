import 'package:bloc_test/bloc_test.dart';
import 'package:flower_app/app/config/base_error/custom_exceptions.dart';
import 'package:flower_app/app/config/base_response/base_response.dart';
import 'package:flower_app/app/config/base_state/base_state.dart';
import 'package:flower_app/app/feature/forget_password/data/model/reset_password_response.dart';
import 'package:flower_app/app/feature/forget_password/domain/request/reset_password_request.dart';
import 'package:flower_app/app/feature/forget_password/domain/use_case/reset_password_use_case.dart';
import 'package:flower_app/app/feature/forget_password/presentation/reset_password/view_model/reset_password_event.dart';
import 'package:flower_app/app/feature/forget_password/presentation/reset_password/view_model/reset_password_intent.dart';
import 'package:flower_app/app/feature/forget_password/presentation/reset_password/view_model/reset_password_state.dart';
import 'package:flower_app/app/feature/forget_password/presentation/reset_password/view_model/reset_password_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'reset_password_view_model_test.mocks.dart';

@GenerateMocks([ResetPasswordUseCase])
void main() {
  late ResetPasswordUseCase resetPasswordUseCase;
  late ResetPasswordViewModel resetPasswordViewModel;
  late ResetPasswordRequest resetPasswordRequest;
  late ResetPasswordResponse resetPasswordResponse;

  setUpAll(() {
    resetPasswordUseCase = MockResetPasswordUseCase();
    resetPasswordRequest =
        ResetPasswordRequest(newPassword: 'password', email: 'email');
    resetPasswordResponse = ResetPasswordResponse();
  });
  setUp(() {
    resetPasswordViewModel = ResetPasswordViewModel(resetPasswordUseCase);
  });

  blocTest(
    'when calling dointent with reset password action it should emit correct state',
    setUp: () {
      provideDummy<BaseResponse<ResetPasswordResponse>>
        (SuccessResponse(data: resetPasswordResponse),
      );
      when(resetPasswordUseCase.invoke(resetPasswordRequest)).thenAnswer((
        realInvocation,
      ) {
        return Future.value(SuccessResponse(data: resetPasswordResponse));
      });
    },
    build: () => resetPasswordViewModel,
    act: (bloc) {
      resetPasswordViewModel.doIntent(
        ResetPasswordAction(resetPasswordRequest),
      );
    },
    expect: () {
      var state = ResetPasswordState(resetPasswordState: BaseState());
      return [
        state.copyWith(resetPasswordState: BaseState(isLoading: true)),
        state.copyWith(
          resetPasswordState: BaseState(success: resetPasswordResponse),
        ),
      ];
    },

  );
  blocTest(
    'when calling dointent with reset password action with error it should emit correct state',
    setUp: () {
      provideDummy<BaseResponse<ResetPasswordResponse>>(
        ErrorResponse(error: UnexpectedError()),
      );
      when(resetPasswordUseCase.invoke(resetPasswordRequest)).thenAnswer((
        realInvocation,
      ) {
        return Future.value(ErrorResponse(error: UnexpectedError()));
      });
    },
    build: () => resetPasswordViewModel,
    act: (bloc) {
      resetPasswordViewModel.doIntent(
        ResetPasswordAction(resetPasswordRequest),
      );
    },
    expect: () {
      var state = ResetPasswordState(resetPasswordState: BaseState());
      return [
        state.copyWith(resetPasswordState: BaseState(isLoading: true)),
        state.copyWith(resetPasswordState: BaseState(error: UnexpectedError())),
      ];
    },

  );
  test('BackNavigation emits event (broadcast)', () async {
    final future = expectLater(
      resetPasswordViewModel.streamController.stream,
      emits(isA<BackNavigationEvent>()),
    );

    resetPasswordViewModel.doIntent(BackNavigationAction());

    await future;
  });
}
