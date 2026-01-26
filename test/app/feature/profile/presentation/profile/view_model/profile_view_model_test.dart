import 'package:bloc_test/bloc_test.dart';
import 'package:flower_app/app/config/base_error/custom_exceptions.dart';
import 'package:flower_app/app/config/base_response/base_response.dart';
import 'package:flower_app/app/config/base_state/base_state.dart';
import 'package:flower_app/app/feature/profile/domain/model/user_entity.dart';
import 'package:flower_app/app/feature/profile/domain/use_case/get_user_data_use_case.dart';
import 'package:flower_app/app/feature/profile/presentation/profile/view_model/profile_event.dart';
import 'package:flower_app/app/feature/profile/presentation/profile/view_model/profile_intent.dart';
import 'package:flower_app/app/feature/profile/presentation/profile/view_model/profile_state.dart';
import 'package:flower_app/app/feature/profile/presentation/profile/view_model/profile_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'profile_view_model_test.mocks.dart';

@GenerateMocks([GetUserDataUseCase])
void main() {
  late GetUserDataUseCase getUserDataUseCase;
  late UserEntity userEntity;
  late ProfileViewModel profileViewModel;
  setUpAll(() {
    getUserDataUseCase = MockGetUserDataUseCase();
    userEntity = UserEntity(email: 's@yahoo.com');
  });
  setUp(() {
    profileViewModel = ProfileViewModel(getUserDataUseCase);
  });

  blocTest(
    'when calling dointent with get user data  action it should emit correct state',
    setUp: () {
      provideDummy<BaseResponse<UserEntity>>(SuccessResponse(data: userEntity));
      when(getUserDataUseCase.invoke()).thenAnswer((realInvocation) {
        return Future.value(SuccessResponse(data: userEntity));
      });
    },
    build: () => profileViewModel,
    act: (bloc) {
      profileViewModel.doIntent(GetProfileAction());
    },
    expect: () {
      var state = ProfileState(profileState: ProfileBaseState());
      return [
        state.copyWith(profileState: ProfileBaseState(isLoading: true)),
        state.copyWith(
          profileState: ProfileBaseState(isLoading: false, success: userEntity),
        ),
      ];
    },
  );
  blocTest(
    'when calling dointent with get user data action with error it should emit correct state',
    setUp: () {
      provideDummy<BaseResponse<UserEntity>>(
        ErrorResponse(error: UnexpectedError()),
      );
      when(getUserDataUseCase.invoke()).thenAnswer((realInvocation) {
        return Future.value(ErrorResponse(error: UnexpectedError()));
      });
    },
    build: () => profileViewModel,
    act: (bloc) {
      profileViewModel.doIntent(GetProfileAction());
    },
    expect: () {
      var state = ProfileState(profileState: ProfileBaseState());
      return [
        state.copyWith(profileState: ProfileBaseState(isLoading: true)),
        state.copyWith(
            profileState: ProfileBaseState(error: UnexpectedError())),
      ];
    },
  );
  blocTest(
    'when calling dointent with Change Language  action  it should emit correct state',

    build: () => profileViewModel,
    act: (bloc) {
      profileViewModel.doIntent(ChangeLanguageAction());
    },
    expect: () {
      var state = ProfileState(profileState: ProfileBaseState());
      return [
        state.copyWith(profileState: ProfileBaseState(isLanguageShowed: true)),
      ];
    },
  );
  test('BackNavigation emits event (broadcast)', () async {
    final future = expectLater(
      profileViewModel.streamController.stream,
      emits(isA<NavigateToEditProfileEvent>()),
    );

    profileViewModel.doIntent(NavigateToEditProfileAction());

    await future;
  });
}
