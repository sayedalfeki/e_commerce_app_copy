import 'package:flower_app/app/config/base_response/base_response.dart';
import 'package:flower_app/app/feature/home/presentation/views/tabs/home_tab/api/api_client/home_tab_api_client.dart';
import 'package:flower_app/app/feature/home/presentation/views/tabs/home_tab/api/datasources/remote/home_tab_remote_data_source_impl.dart';
import 'package:flower_app/app/feature/home/presentation/views/tabs/home_tab/data/models/get_home_tab_response.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'home_tab_remote_data_source_impl_test.mocks.dart';
@GenerateMocks([HomeTabApiClient])
void main() {
  late HomeTabRemoteDataSourceImpl homeTabRemoteDataSourceImpl;
  late MockHomeTabApiClient mockHomeTabApiClient;
  setUpAll(() {
    mockHomeTabApiClient=MockHomeTabApiClient();
    homeTabRemoteDataSourceImpl=HomeTabRemoteDataSourceImpl(mockHomeTabApiClient);
  },);
  test('testing functionality of getHomeTabDetails function', () async{
    final dummyRes=GetHomeTabResponse(categories: [],occasions: [],bestSeller: []);
    when(mockHomeTabApiClient.getHomeTabDetails()).thenAnswer(
      (_) async=> dummyRes,
    );
    final result=await homeTabRemoteDataSourceImpl.getHomeTabDetails();
    expect(result, isA<BaseResponse<GetHomeTabResponse>>());
    verify(mockHomeTabApiClient.getHomeTabDetails()).called(1);
  },);
}