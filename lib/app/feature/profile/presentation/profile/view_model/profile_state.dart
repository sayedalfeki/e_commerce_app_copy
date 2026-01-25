import 'package:equatable/equatable.dart';
import 'package:flower_app/app/config/base_state/base_state.dart';
import 'package:flower_app/app/feature/profile/domain/model/logout_model.dart';
import 'package:flower_app/app/feature/profile/domain/model/user_entity.dart';

class ProfileState extends Equatable {
  final BaseState<UserEntity> profileState;
  final BaseState<LogoutModel> logoutState;

  const ProfileState({required this.profileState, required this.logoutState});

  ProfileState copyWith({BaseState<UserEntity>? profileState, BaseState<LogoutModel>? logoutState}) {
    return ProfileState(
      profileState: BaseState(
        isLoading: profileState?.isLoading ?? this.profileState.isLoading,
        success: profileState?.success ?? this.profileState.success,
        error: profileState?.error ?? this.profileState.error,
      ),
      logoutState: BaseState(
        isLoading: false,
        success: logoutState?.success ?? this.logoutState.success,
        error: logoutState?.error ?? this.logoutState.error,
      ),
    );
  }

  @override
  List<Object?> get props => [profileState];
}
