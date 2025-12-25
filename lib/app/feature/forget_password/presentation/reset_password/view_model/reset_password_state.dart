import 'package:equatable/equatable.dart';

import '../../../../../config/base_state/base_state.dart';

class ResetPasswordState extends Equatable {
  final BaseState resetPasswordState;
  ResetPasswordState({required this.resetPasswordState});
  ResetPasswordState copyWith({BaseState? resetPasswordState}){
    return ResetPasswordState(resetPasswordState: resetPasswordState ?? this.resetPasswordState);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [resetPasswordState];
}


