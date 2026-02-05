import 'package:flower_app/app/config/local_storage_processes/domain/use_case/get_remember_me_use_case.dart';
import 'package:flower_app/app/feature/splash/presentation/view_model/splash_event.dart';
import 'package:flower_app/app/feature/splash/presentation/view_model/splash_intent.dart';
import 'package:flower_app/app/feature/splash/presentation/view_model/splash_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'splash_view_model_test.mocks.dart';

@GenerateMocks([GetRememberMeUseCase])
void main() {
  late MockGetRememberMeUseCase mockUseCase;
  late SplashViewModel viewModel;

  setUp(() {
    mockUseCase = MockGetRememberMeUseCase();
    viewModel = SplashViewModel(mockUseCase);
  });

  tearDown(() {
    viewModel.close();
  });

  // ---------------- rememberMe = true ----------------
  test('should navigate to home when rememberMe is true', () async {
    // arrange
    when(mockUseCase.invoke()).thenReturn(true);

    // act
    viewModel.doIntent(NavigateAction());

    // assert
    await expectLater(
      viewModel.streamController.stream,
      emitsInOrder([isA<NavigateToHomeEvent>()]),
    );
  });

  // ---------------- rememberMe = false ----------------
  test('should navigate to login when rememberMe is false', () async {
    // arrange
    when(mockUseCase.invoke()).thenReturn(false);

    // act
    viewModel.doIntent(NavigateAction());

    // assert
    await expectLater(
      viewModel.streamController.stream,
      emitsInOrder([isA<NavigateToLoginEvent>()]),
    );
  });

  // ---------------- rememberMe = null ----------------
  test('should navigate to login when rememberMe is null', () async {
    // arrange
    when(mockUseCase.invoke()).thenReturn(null);

    // act
    viewModel.doIntent(NavigateAction());

    // assert
    await expectLater(
      viewModel.streamController.stream,
      emitsInOrder([isA<NavigateToLoginEvent>()]),
    );
  });
}
