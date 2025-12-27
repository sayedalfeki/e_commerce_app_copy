import 'package:flower_app/app/config/base_state/base_state.dart';
import 'package:flower_app/app/feature/auth/domain/model/auth_model.dart';

class LoginStates {
  BaseState<AuthModel>? loginState;
  int rememberMeChickBox;

  LoginStates({this.loginState, this.rememberMeChickBox = 0});

  LoginStates copyWith({
    BaseState<AuthModel>? loginStateParam,
    int? rememberMeChickBox,
  }) {
    return LoginStates(
      loginState: loginStateParam ?? this.loginState,
      rememberMeChickBox: rememberMeChickBox ?? this.rememberMeChickBox,
    );
  }
}
