import 'package:flower_app/app/config/base_state/base_state.dart';
import 'package:flower_app/app/config/base_state/custom_cubit.dart';
import 'package:flower_app/app/config/local_storage_processes/domain/use_case/get_remember_me_use_case.dart';
import 'package:flower_app/app/feature/splash/presentation/view_model/splash_event.dart';
import 'package:flower_app/app/feature/splash/presentation/view_model/splash_intent.dart';
import 'package:flower_app/app/feature/splash/presentation/view_model/splash_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class SplashViewModel extends CustomCubit<SplashEvent, SplashState> {
  final GetRememberMeUseCase _getRememberMeUseCase;

  SplashViewModel(this._getRememberMeUseCase)
    : super(SplashState(splashState: BaseState()));

  void doIntent(SplashIntent intent) {
    switch (intent) {
      case NavigateAction():
        {
          _initSplash();
        }
    }
  }

  Future<void> _initSplash() async {
    final rememberMeResult = _getRememberMeUseCase.invoke();
    if (rememberMeResult != null && rememberMeResult == true) {
      _navToHome();
    } else {
      _navToLogin();
    }
//     switch (result) {
    //       case SuccessResponse<String?>():
    //         if (result.data == null || result.data!.isEmpty) {
    //           final rememberMeResult = await _getRememberMeUseCase.invoke();
    //          switch(rememberMeResult){
    //            case SuccessResponse<bool>():
    //              if(rememberMeResult.data==true) {
    //                _navToLogin();
    //              }
    //            case ErrorResponse<bool>():
    //              // TODO: Handle this case.
    //              throw UnimplementedError();
    // }        } else {
    //           _navToHome();
    //         }
    //       case ErrorResponse<String?>():
    //         emit(state.copyWith(splashState: BaseState(error: result.error)));
    //     }
    //todo
    // if (token == null || token.isEmpty) {
    //   _navToLogin();
    // } else {
    //   _navToHome();
    // }
  }

  void _navToLogin() {
    Future.delayed(
      const Duration(seconds: 2),
      () => streamController.add(NavigateToLoginEvent()),
    );
  }

  void _navToHome() {
    Future.delayed(
      const Duration(seconds: 2),
      () => streamController.add(NavigateToHomeEvent()),
    );
  }
}
