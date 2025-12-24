

import '../../../../../config/base_state/base_state.dart';

class VerifyOtpState {
  final BaseState verifyOtpState;
  VerifyOtpState({required this.verifyOtpState});
  VerifyOtpState copyWith({BaseState? verifyOtpState}){
    return VerifyOtpState(verifyOtpState: verifyOtpState ?? this.verifyOtpState);
  }
}