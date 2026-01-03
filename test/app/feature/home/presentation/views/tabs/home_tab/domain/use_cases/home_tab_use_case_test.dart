import 'package:flower_app/app/config/base_response/base_response.dart';
import 'package:flower_app/app/feature/home/presentation/views/tabs/home_tab/data/repos/home_tab_repo_impl.dart';
import 'package:flower_app/app/feature/home/presentation/views/tabs/home_tab/domain/models/get_home_tab_response_model.dart';
import 'package:flower_app/app/feature/home/presentation/views/tabs/home_tab/domain/use_cases/home_tab_use_case.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'home_tab_use_case_test.mocks.dart';
@GenerateMocks([HomeTabRepoImpl])
void main() {
  late HomeTabUseCase homeTabUseCase;
  late MockHomeTabRepoImpl mockHomeTabRepoImpl;
  setUpAll(() {
    provideDummy<BaseResponse<GetHomeTabResponseModel>>(SuccessResponse<GetHomeTabResponseModel>(data: GetHomeTabResponseModel()));
    mockHomeTabRepoImpl=MockHomeTabRepoImpl();
    homeTabUseCase=HomeTabUseCase(mockHomeTabRepoImpl);
  },);
  group('HomeTabUseCase test cases', () {
    test('testing call function in success', () async{
      final dummyRes=GetHomeTabResponseModel(
        categories: [],occasions: [],bestSellers: []
      );
      when(mockHomeTabRepoImpl.getHomeTabDetails()).thenAnswer(
        (_) async=> SuccessResponse<GetHomeTabResponseModel>(data: dummyRes),
      );
      final reult=await homeTabUseCase.call();
      expect(reult, isA<SuccessResponse<GetHomeTabResponseModel>>());
      verify(mockHomeTabRepoImpl.getHomeTabDetails()).called(1);
    },);
  },);
  test('testing call function in error', () async{
    final dummyError=Exception("Network error");
    when(mockHomeTabRepoImpl.getHomeTabDetails()).thenAnswer(
      (_)async => ErrorResponse<GetHomeTabResponseModel>(error: dummyError),
    );
    final reult=await homeTabUseCase.call();
    expect(reult, isA<ErrorResponse<GetHomeTabResponseModel>>());
    verify(mockHomeTabRepoImpl.getHomeTabDetails()).called(1);
  },);
}