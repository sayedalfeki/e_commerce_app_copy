import 'package:equatable/equatable.dart';
import 'package:flower_app/app/config/base_state/base_state.dart';
import 'package:flower_app/app/feature/profile/domain/model/user_entity.dart';

class ProfileState extends Equatable {
  final BaseState<UserEntity> profileState;

  const ProfileState({required this.profileState});

  ProfileState copyWith({BaseState<UserEntity>? profileState}) {
    return ProfileState(
      profileState: BaseState(
        isLoading: profileState?.isLoading ?? this.profileState.isLoading,
        success: profileState?.success ?? this.profileState.success,
        error: profileState?.error ?? this.profileState.error,
      ),
    );
  }

  @override
  List<Object?> get props => [profileState];
}
