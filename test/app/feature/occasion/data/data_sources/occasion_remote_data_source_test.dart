import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flower_app/app/config/base_response/base_response.dart';
import 'package:flower_app/app/core/endpoint/app_endpoint.dart';
import 'package:flower_app/app/feature/occasion/data/data_sources/occasion_remote_data_source.dart';
import 'package:flower_app/app/feature/occasion/data/models/occasion_model.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'occasion_remote_data_source_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  late OccasionRemoteDataSourceImpl dataSource;
  late MockDio mockDio;

  setUp(() {
    mockDio = MockDio();
    dataSource = OccasionRemoteDataSourceImpl(mockDio);
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

    test('returns success response with occasions list', () async {
      when(mockDio.get(AppEndPoint.occasions)).thenAnswer(
        (_) async => Response(
          data: occasionsData,
          statusCode: 200,
          requestOptions: RequestOptions(path: AppEndPoint.occasions),
        ),
      );

      final response = await dataSource.getAllOccasions();

      expect(response, isA<SuccessResponse<List<OccasionModel>>>());
      final success = response as SuccessResponse<List<OccasionModel>>;
      expect(success.data.length, 2);
      expect(success.data[0].name, 'Wedding');
      expect(success.data[0].slug, 'wedding');
      expect(success.data[0].productsCount, 5);
      expect(success.data[1].name, 'Birthday');
      expect(success.data[1].slug, 'birthday');
      expect(success.data[1].productsCount, 3);
      verify(mockDio.get(AppEndPoint.occasions)).called(1);
    });

    test('returns error response on non-200 status', () async {
      when(mockDio.get(AppEndPoint.occasions)).thenAnswer(
        (_) async => Response(
          data: {'error': 'Server error'},
          statusCode: 500,
          requestOptions: RequestOptions(path: AppEndPoint.occasions),
        ),
      );

      final response = await dataSource.getAllOccasions();

      expect(response, isA<ErrorResponse<List<OccasionModel>>>());
      verify(mockDio.get(AppEndPoint.occasions)).called(1);
    });

    test('returns error response on exception', () async {
      when(mockDio.get(AppEndPoint.occasions)).thenThrow(
        DioException(
          requestOptions: RequestOptions(path: AppEndPoint.occasions),
          type: DioExceptionType.connectionTimeout,
        ),
      );

      final response = await dataSource.getAllOccasions();

      expect(response, isA<ErrorResponse<List<OccasionModel>>>());
      verify(mockDio.get(AppEndPoint.occasions)).called(1);
    });

    test('returns empty list when no occasions', () async {
      when(mockDio.get(AppEndPoint.occasions)).thenAnswer(
        (_) async => Response(
          data: {'occasions': []},
          statusCode: 200,
          requestOptions: RequestOptions(path: AppEndPoint.occasions),
        ),
      );

      final response = await dataSource.getAllOccasions();

      expect(response, isA<SuccessResponse<List<OccasionModel>>>());
      final success = response as SuccessResponse<List<OccasionModel>>;
      expect(success.data, isEmpty);
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

    test('returns success response with occasion', () async {
      when(mockDio.get(AppEndPoint.occasionById(occasionId))).thenAnswer(
        (_) async => Response(
          data: occasionData,
          statusCode: 200,
          requestOptions: RequestOptions(
            path: AppEndPoint.occasionById(occasionId),
          ),
        ),
      );

      final response = await dataSource.getOccasionById(occasionId);

      expect(response, isA<SuccessResponse<OccasionModel>>());
      final success = response as SuccessResponse<OccasionModel>;
      expect(success.data.id, occasionId);
      expect(success.data.name, 'Wedding');
      expect(success.data.slug, 'wedding');
      expect(success.data.productsCount, 5);
      verify(mockDio.get(AppEndPoint.occasionById(occasionId))).called(1);
    });

    test('returns error response on failure', () async {
      when(mockDio.get(AppEndPoint.occasionById(occasionId))).thenAnswer(
        (_) async => Response(
          data: {},
          statusCode: 404,
          requestOptions: RequestOptions(
            path: AppEndPoint.occasionById(occasionId),
          ),
        ),
      );

      final response = await dataSource.getOccasionById(occasionId);

      expect(response, isA<ErrorResponse<OccasionModel>>());
      verify(mockDio.get(AppEndPoint.occasionById(occasionId))).called(1);
    });
  });
}
