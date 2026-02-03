import 'package:flower_app/app/config/base_response/base_response.dart';
import 'package:flower_app/app/config/base_state/custom_cubit.dart';
import 'package:flower_app/app/feature/profile/domain/model/user_entity.dart';
import 'package:flower_app/app/feature/profile/presentation/profile/view_model/profile_event.dart';
import 'package:flower_app/app/feature/profile/presentation/profile/view_model/profile_intent.dart';
import 'package:flower_app/app/feature/profile/presentation/profile/view_model/profile_state.dart';
import 'package:injectable/injectable.dart';

import '../../../../../config/base_state/base_state.dart';
import '../../../domain/use_case/get_user_data_use_case.dart';

@injectable
class ProfileViewModel extends CustomCubit<ProfileEvent, ProfileState> {
  final GetUserDataUseCase _getUserDataUseCase;

  ProfileViewModel(this._getUserDataUseCase)
    : super(ProfileState(profileState: BaseState()));

  Future<void> _getUserData() async {
    emit(state.copyWith(profileState: BaseState(isLoading: true)));
    final response = await _getUserDataUseCase.invoke();
    switch (response) {
      case SuccessResponse<UserEntity>():
        emit(
          state.copyWith(
            profileState: BaseState(isLoading: false, success: response.data),
          ),
        );
        break;
      case ErrorResponse<UserEntity>():
        emit(
          state.copyWith(
            profileState: BaseState(isLoading: false, error: response.error),
          ),
        );
        break;
    }
  }

  void doIntent(ProfileIntent intent) {
    switch (intent) {
      case GetProfileAction():
        _getUserData();
        break;
      case NavigateToEditProfileAction():
        streamController.add(NavigateToEditProfileEvent());
        break;
      case NavigateToAddressScreenAction():
        streamController.add(NavigateToAddressScreenEvent());
        break;
    }
  }
}
