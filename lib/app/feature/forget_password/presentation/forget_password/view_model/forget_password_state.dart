

import '../../../../../config/base_state/base_state.dart';
import '../../../data/model/forget_password_response.dart';

class ForgetPasswordState {
  final BaseState<ForgetPasswordResponse> forgetPasswordState;
  ForgetPasswordState({required this.forgetPasswordState});
  ForgetPasswordState copyWith({BaseState<ForgetPasswordResponse>? forgetPasswordState}){
    return ForgetPasswordState(forgetPasswordState: forgetPasswordState ?? this.forgetPasswordState);
  }
}