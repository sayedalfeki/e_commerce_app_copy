import 'package:equatable/equatable.dart';
import 'package:flower_app/app/config/base_state/base_state.dart';
import 'package:flower_app/app/feature/profile/domain/model/user_entity.dart';

class ProfileState extends Equatable {
  final ProfileBaseState profileState;

  const ProfileState({required this.profileState});

  ProfileState copyWith({ProfileBaseState? profileState}) {
    return ProfileState(
      profileState: ProfileBaseState(
        isLoading: profileState?.isLoading ?? this.profileState.isLoading,
        success: profileState?.success ?? this.profileState.success,
        error: profileState?.error ?? this.profileState.error,
        isLanguageShowed: profileState?.isLanguageShowed ??
            this.profileState.isLanguageShowed,
      ),
    );
  }

  @override
  List<Object?> get props => [profileState];
}

class ProfileBaseState extends BaseState<UserEntity> with EquatableMixin {
  bool? isLanguageShowed;

  ProfileBaseState({
    super.isLoading,
    super.success,
    super.error,
    this.isLanguageShowed
  });

  @override
  List<Object?> get props => [isLoading, success, error, isLanguageShowed];
}
