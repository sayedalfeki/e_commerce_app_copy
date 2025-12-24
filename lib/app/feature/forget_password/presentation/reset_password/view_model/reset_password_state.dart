

import '../../../../../config/base_state/base_state.dart';

class ResetPasswordState {
  final BaseState resetPasswordState;
  ResetPasswordState({required this.resetPasswordState});
  ResetPasswordState copyWith({BaseState? resetPasswordState}){
    return ResetPasswordState(resetPasswordState: resetPasswordState ?? this.resetPasswordState);
  }
}