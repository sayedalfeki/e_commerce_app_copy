import 'package:flower_app/app/config/base_response/base_response.dart';
import 'package:flower_app/app/feature/occasion/data/models/occasion_model.dart';
import 'package:flower_app/app/feature/occasion/domain/repositories/occasion_repository.dart';
import 'package:flower_app/app/feature/occasion/domain/use_cases/get_all_occasions_use_case.dart';
import 'package:flower_app/app/feature/occasion/presentation/view_model/occasion_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'occasion_view_model_test.mocks.dart';

@GenerateMocks([OccasionRepository])
void main() {
  late MockOccasionRepository mockRepository;
  late GetAllOccasionsUseCase useCase;
  late OccasionViewModel viewModel;

  setUp(() {
    mockRepository = MockOccasionRepository();
    useCase = GetAllOccasionsUseCase(mockRepository);
    viewModel = OccasionViewModel(useCase);
    provideDummy<BaseResponse<List<OccasionModel>>>(SuccessResponse(data: []));
  });

  group('OccasionViewModel', () {
    final occasions = [
      OccasionModel(
        id: '1',
        name: 'Wedding',
        slug: 'wedding',
        image: 'wedding.jpg',
        createdAt: '2024-01-01',
        updatedAt: '2024-01-01',
        isSuperAdmin: true,
        productsCount: 5,
      ),
      OccasionModel(
        id: '2',
        name: 'Birthday',
        slug: 'birthday',
        image: 'birthday.jpg',
        createdAt: '2024-01-01',
        updatedAt: '2024-01-01',
        isSuperAdmin: true,
        productsCount: 3,
      ),
    ];

    test('initial state is correct', () {
      expect(viewModel.occasions, isEmpty);
      expect(viewModel.isLoading, false);
      expect(viewModel.errorMessage, isNull);
      expect(viewModel.selectedTabIndex, 0);
    });

    test('getAllOccasions sets loading state correctly', () async {
      when(
        mockRepository.getAllOccasions(),
      ).thenAnswer((_) async => SuccessResponse(data: occasions));

      expect(viewModel.isLoading, false);

      final future = viewModel.getAllOccasions();
      expect(viewModel.isLoading, true);

      await future;
      expect(viewModel.isLoading, false);
    });

    test('getAllOccasions populates occasions on success', () async {
      when(
        mockRepository.getAllOccasions(),
      ).thenAnswer((_) async => SuccessResponse(data: occasions));

      await viewModel.getAllOccasions();

      expect(viewModel.occasions, occasions);
      expect(viewModel.occasions.length, 2);
      expect(viewModel.errorMessage, isNull);
    });

    test('getAllOccasions sets error on failure', () async {
      final error = Exception('Failed to load occasions');
      when(
        mockRepository.getAllOccasions(),
      ).thenAnswer((_) async => ErrorResponse(error: error));

      await viewModel.getAllOccasions();

      expect(viewModel.occasions, isEmpty);
      expect(viewModel.errorMessage, isNotNull);
      expect(viewModel.errorMessage, contains('Exception'));
    });

    test('getAllOccasions clears error on retry', () async {
      when(
        mockRepository.getAllOccasions(),
      ).thenAnswer((_) async => ErrorResponse(error: Exception('Error')));

      await viewModel.getAllOccasions();
      expect(viewModel.errorMessage, isNotNull);

      when(
        mockRepository.getAllOccasions(),
      ).thenAnswer((_) async => SuccessResponse(data: occasions));

      await viewModel.getAllOccasions();

      expect(viewModel.errorMessage, isNull);
      expect(viewModel.occasions, occasions);
    });

    test('selectTab updates selectedTabIndex', () {
      viewModel.occasions.addAll(occasions);
      viewModel.selectTab(1);
      expect(viewModel.selectedTabIndex, 1);
    });

    test('selectedOccasion returns correct occasion', () async {
      when(
        mockRepository.getAllOccasions(),
      ).thenAnswer((_) async => SuccessResponse(data: occasions));

      await viewModel.getAllOccasions();

      expect(viewModel.selectedOccasion, occasions[0]);

      viewModel.selectTab(1);
      expect(viewModel.selectedOccasion, occasions[1]);
    });

    test('selectedOccasion returns null when empty', () {
      expect(viewModel.selectedOccasion, isNull);
    });

    test('selectedOccasion returns null when index out of bounds', () async {
      when(
        mockRepository.getAllOccasions(),
      ).thenAnswer((_) async => SuccessResponse(data: occasions));

      await viewModel.getAllOccasions();
      viewModel.selectTab(999);

      expect(viewModel.selectedOccasion, isNull);
    });

    test('notifies listeners on state changes', () async {
      when(
        mockRepository.getAllOccasions(),
      ).thenAnswer((_) async => SuccessResponse(data: occasions));

      int notifyCount = 0;
      viewModel.addListener(() {
        notifyCount++;
      });

      await viewModel.getAllOccasions();

      expect(notifyCount, greaterThanOrEqualTo(2));
    });
  });
}
