import 'package:flower_app/app/config/base_response/base_response.dart';
import 'package:flower_app/app/config/base_state/base_state.dart';
import 'package:flower_app/app/config/local_storage_processes/local_storage_processes.dart';
import 'package:flower_app/app/feature/auth/domain/model/auth_model.dart';
import 'package:flower_app/app/feature/auth/domain/use_case/get_auth_use_case.dart';
import 'package:flower_app/app/feature/auth/presentation/view_model/login_events.dart';
import 'package:flower_app/app/feature/auth/presentation/view_model/login_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginViewModel extends Cubit<LoginStates> {
  LoginViewModel(this._authUseCase) : super(LoginStates());

  final GetAuthUseCase _authUseCase;

  void doIntent(LoginEvents event, {String email = "", String password = ""}) {
    switch (event) {
      case LoginEvent():
        _login(email, password);
        return;
      case RememberMeEvent():
        _rememberMeChickBox();
        return;
    }
  }

  Future<void> _login(String email, String password) async {
    emit(
      state.copyWith(loginStateParam: BaseState<AuthModel>(isLoading: true)),
    );

    final loginResponse = await _authUseCase.login(email, password);
    if (isClosed) return;

    switch (loginResponse) {
      case SuccessResponse<AuthModel>():
        emit(
          state.copyWith(
            loginStateParam: BaseState<AuthModel>(
              success: loginResponse.data,
              isLoading: false,
            ),
          ),
        );
        LocalStorageProcesses.writeToken(loginResponse.data.tokin!);
        return;

      case ErrorResponse<AuthModel>():
        emit(
          state.copyWith(
            loginStateParam: BaseState<AuthModel>(
              error: loginResponse.error,
              isLoading: false,
            ),
          ),
        );
        return;
    }
  }

  void _rememberMeChickBox() {
    final newValue = state.rememberMeChickBox == 0 ? 1 : 0;
    emit(state.copyWith(rememberMeChickBox: newValue));
  }
}
