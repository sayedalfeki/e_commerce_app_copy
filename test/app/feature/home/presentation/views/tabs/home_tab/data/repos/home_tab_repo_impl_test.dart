import 'package:flower_app/app/config/base_response/base_response.dart';
import 'package:flower_app/app/feature/home/presentation/views/tabs/home_tab/api/datasources/remote/home_tab_remote_data_source_impl.dart';
import 'package:flower_app/app/feature/home/presentation/views/tabs/home_tab/data/models/best_seller_dto.dart';
import 'package:flower_app/app/feature/home/presentation/views/tabs/home_tab/data/models/category_dto.dart';
import 'package:flower_app/app/feature/home/presentation/views/tabs/home_tab/data/models/get_home_tab_response.dart';
import 'package:flower_app/app/feature/home/presentation/views/tabs/home_tab/data/models/occasion_dto.dart';
import 'package:flower_app/app/feature/home/presentation/views/tabs/home_tab/data/repos/home_tab_repo_impl.dart';
import 'package:flower_app/app/feature/home/presentation/views/tabs/home_tab/domain/models/category_model.dart';
import 'package:flower_app/app/feature/home/presentation/views/tabs/home_tab/domain/models/get_home_tab_response_model.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'home_tab_repo_impl_test.mocks.dart';
@GenerateMocks([HomeTabRemoteDataSourceImpl])
void main() {
  late HomeTabRepoImpl homeTabRepoImpl;
  late MockHomeTabRemoteDataSourceImpl mockHomeTabRemoteDataSourceImpl;
  setUpAll(() {
    provideDummy<BaseResponse<GetHomeTabResponse>>(SuccessResponse<GetHomeTabResponse>(data: GetHomeTabResponse()));
    mockHomeTabRemoteDataSourceImpl=MockHomeTabRemoteDataSourceImpl();
    homeTabRepoImpl=HomeTabRepoImpl(mockHomeTabRemoteDataSourceImpl);
  },);
  group('getHomeTabDetails test cases', () {
    test('success case with home tab resonse',() async{
      GetHomeTabResponse dummyHomeTabResponse=GetHomeTabResponse(
        bestSeller: [BestSellerDTO(id: 'id1',title: 'title1'),BestSellerDTO(id: 'id2',title: 'title2')],
        categories: [CategoryDTO(id: 'id1',name: 'name1'),CategoryDTO(id: 'id2',name: 'name2')],
        occasions: [OccasionDTO(id: 'id1',name: 'name1'),OccasionDTO(id: 'id2',name: 'name2')]
      );
      when(mockHomeTabRemoteDataSourceImpl.getHomeTabDetails()).thenAnswer(
        (_) async=>SuccessResponse<GetHomeTabResponse>(data: dummyHomeTabResponse) ,
      );
      final result=await homeTabRepoImpl.getHomeTabDetails();
      expect(result, isA<SuccessResponse<GetHomeTabResponseModel>>());
      expect((result as SuccessResponse<GetHomeTabResponseModel>).data.categories, isA<List<CategoryModel>>());
      expect(result.data.categories?.length, equals(dummyHomeTabResponse.categories?.length));
      expect(result.data.categories?[0].id, dummyHomeTabResponse.categories?[0].id);
      expect(result.data.categories?[0].name, dummyHomeTabResponse.categories?[0].name);
      expect(result.data.categories?[1].id, dummyHomeTabResponse.categories?[1].id);
      expect(result.data.categories?[1].name, dummyHomeTabResponse.categories?[1].name);
      verify(mockHomeTabRemoteDataSourceImpl.getHomeTabDetails()).called(1);
    });
    test('Error test case', () async{
      Exception dummyException=Exception("Network Error");
      when(mockHomeTabRemoteDataSourceImpl.getHomeTabDetails()).thenAnswer(
        (_) async=>ErrorResponse<GetHomeTabResponse>(error: dummyException) ,
      );
      final result=await homeTabRepoImpl.getHomeTabDetails();
      expect(result, isA<ErrorResponse<GetHomeTabResponseModel>>());
      expect((result as ErrorResponse<GetHomeTabResponseModel>).error.toString(), dummyException.toString());
      verify(mockHomeTabRemoteDataSourceImpl.getHomeTabDetails()).called(1);
    },);
  },);
}