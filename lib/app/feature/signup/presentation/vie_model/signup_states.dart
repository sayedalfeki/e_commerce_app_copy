
import 'package:flower_app/app/config/base_state/base_state.dart';
import 'package:flower_app/app/feature/signup/domain/models/signup_model.dart';

class SignupStates {
  BaseState<SignupModel>? signupState;

  SignupStates({this.signupState});
  
  SignupStates copyWith({BaseState<SignupModel>? signupStateParam}){
    return SignupStates(signupState: signupStateParam??signupState);
  }
}