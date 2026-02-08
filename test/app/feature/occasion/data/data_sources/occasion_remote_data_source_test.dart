import 'package:flower_app/app/config/base_response/base_response.dart';
import 'package:flower_app/app/feature/occasion/data/api_client/occasion_api_client.dart';
import 'package:flower_app/app/feature/occasion/data/data_sources/occasion_remote_data_source.dart';
import 'package:flower_app/app/feature/occasion/data/models/occasion_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'occasion_remote_data_source_test.mocks.dart';

@GenerateMocks([OccasionApiClient])
void main() {
  late MockOccasionApiClient mockApiClient;
  late OccasionRemoteDataSourceImpl dataSource;

  setUp(() {
    mockApiClient = MockOccasionApiClient();
    dataSource = OccasionRemoteDataSourceImpl(mockApiClient);
  });

  group('getAllOccasions', () {
    final occasionsData = {
      'occasions': [
        {
          '_id': '1',
          'name': 'Wedding',
          'slug': 'wedding',
          'image': 'wedding.jpg',
          'createdAt': '2024-01-01',
          'updatedAt': '2024-01-01',
          'isSuperAdmin': true,
          'productsCount': 5,
        },
        {
          '_id': '2',
          'name': 'Birthday',
          'slug': 'birthday',
          'image': 'birthday.jpg',
          'createdAt': '2024-01-01',
          'updatedAt': '2024-01-01',
          'isSuperAdmin': true,
          'productsCount': 3,
        },
      ],
    };

    test('returns SuccessResponse when API call succeeds', () async {
      when(
        mockApiClient.getAllOccasions(),
      ).thenAnswer((_) async => occasionsData);

      final result = await dataSource.getAllOccasions();

      expect(result, isA<SuccessResponse<List<OccasionModel>>>());
      final success = result as SuccessResponse<List<OccasionModel>>;
      expect(success.data.length, 2);
      expect(success.data[0].name, 'Wedding');
      expect(success.data[1].name, 'Birthday');

      verify(mockApiClient.getAllOccasions()).called(1);
    });

    test('returns ErrorResponse when API call throws exception', () async {
      when(
        mockApiClient.getAllOccasions(),
      ).thenThrow(Exception('Network error'));

      final result = await dataSource.getAllOccasions();

      expect(result, isA<ErrorResponse<List<OccasionModel>>>());

      verify(mockApiClient.getAllOccasions()).called(1);
    });

    test('returns empty list when no occasions', () async {
      when(
        mockApiClient.getAllOccasions(),
      ).thenAnswer((_) async => {'occasions': []});

      final result = await dataSource.getAllOccasions();

      expect(result, isA<SuccessResponse<List<OccasionModel>>>());
      final success = result as SuccessResponse<List<OccasionModel>>;
      expect(success.data, isEmpty);

      verify(mockApiClient.getAllOccasions()).called(1);
    });
  });

  group('getOccasionById', () {
    const occasionId = '673b34c21159920171827ae0';
    final occasionData = {
      'data': {
        '_id': occasionId,
        'name': 'Wedding',
        'slug': 'wedding',
        'image': 'wedding.jpg',
        'createdAt': '2024-01-01',
        'updatedAt': '2024-01-01',
        'isSuperAdmin': true,
        'productsCount': 5,
      },
    };

    test('returns SuccessResponse when API call succeeds', () async {
      when(
        mockApiClient.getOccasionById(occasionId),
      ).thenAnswer((_) async => occasionData);

      final result = await dataSource.getOccasionById(occasionId);

      expect(result, isA<SuccessResponse<OccasionModel>>());
      final success = result as SuccessResponse<OccasionModel>;
      expect(success.data.id, occasionId);
      expect(success.data.name, 'Wedding');

      verify(mockApiClient.getOccasionById(occasionId)).called(1);
    });

    test('returns ErrorResponse when API call throws exception', () async {
      when(
        mockApiClient.getOccasionById(occasionId),
      ).thenThrow(Exception('Not found'));

      final result = await dataSource.getOccasionById(occasionId);

      expect(result, isA<ErrorResponse<OccasionModel>>());

      verify(mockApiClient.getOccasionById(occasionId)).called(1);
    });
  });
}
