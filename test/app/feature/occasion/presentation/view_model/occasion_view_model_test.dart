import 'package:bloc_test/bloc_test.dart';
import 'package:flower_app/app/config/base_response/base_response.dart';
import 'package:flower_app/app/config/base_state/base_state.dart';
import 'package:flower_app/app/feature/occasion/data/models/occasion_model.dart';
import 'package:flower_app/app/feature/occasion/domain/repositories/occasion_repository.dart';
import 'package:flower_app/app/feature/occasion/domain/use_cases/get_all_occasions_use_case.dart';
import 'package:flower_app/app/feature/occasion/presentation/view_model/occasion_events.dart';
import 'package:flower_app/app/feature/occasion/presentation/view_model/occasion_states.dart';
import 'package:flower_app/app/feature/occasion/presentation/view_model/occasion_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'occasion_view_model_test.mocks.dart';

@GenerateMocks([OccasionRepository])
void main() {
  late MockOccasionRepository mockRepository;
  late GetAllOccasionsUseCase useCase;

  setUp(() {
    mockRepository = MockOccasionRepository();
    useCase = GetAllOccasionsUseCase(mockRepository);
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
      final viewModel = OccasionViewModel(useCase);
      expect(viewModel.state.occasionsState, isNull);
      expect(viewModel.state.selectedTabIndex, 0);
    });

    blocTest<OccasionViewModel, OccasionStates>(
      'emits loading then success states when GetAllOccasionsEvent succeeds',
      build: () {
        when(
          mockRepository.getAllOccasions(),
        ).thenAnswer((_) async => SuccessResponse(data: occasions));
        return OccasionViewModel(useCase);
      },
      act: (viewModel) => viewModel.doIntent(GetAllOccasionsEvent()),
      expect: () => [
        OccasionStates(
          occasionsState: BaseState(isLoading: true),
          selectedTabIndex: 0,
        ),
        OccasionStates(
          occasionsState: BaseState(isLoading: false, success: occasions),
          selectedTabIndex: 0,
        ),
      ],
    );

    blocTest<OccasionViewModel, OccasionStates>(
      'emits loading then error states when GetAllOccasionsEvent fails',
      build: () {
        final error = Exception('Failed to load occasions');
        when(
          mockRepository.getAllOccasions(),
        ).thenAnswer((_) async => ErrorResponse(error: error));
        return OccasionViewModel(useCase);
      },
      act: (viewModel) => viewModel.doIntent(GetAllOccasionsEvent()),
      expect: () => [
        OccasionStates(
          occasionsState: BaseState(isLoading: true),
          selectedTabIndex: 0,
        ),
        predicate<OccasionStates>((state) {
          return state.occasionsState?.isLoading == false &&
              state.occasionsState?.error != null &&
              state.selectedTabIndex == 0;
        }),
      ],
    );

    test('clears error on retry', () async {
      when(
        mockRepository.getAllOccasions(),
      ).thenAnswer((_) async => SuccessResponse(data: occasions));

      final viewModel = OccasionViewModel(useCase);

      // First call - will emit loading + success
      viewModel.doIntent(GetAllOccasionsEvent());
      await Future.delayed(const Duration(milliseconds: 100));

      // Verify first call succeeded
      expect(viewModel.state.occasionsState?.success, equals(occasions));
      expect(viewModel.state.occasionsState?.isLoading, isFalse);

      // Second call - retry, should emit loading + success again
      viewModel.doIntent(GetAllOccasionsEvent());
      await Future.delayed(const Duration(milliseconds: 100));

      // Verify second call also succeeded
      expect(viewModel.state.occasionsState?.success, equals(occasions));
      expect(viewModel.state.occasionsState?.isLoading, isFalse);
      expect(viewModel.state.occasionsState?.error, isNull);
    });

    blocTest<OccasionViewModel, OccasionStates>(
      'updates selectedTabIndex when SelectTabEvent is triggered',
      build: () => OccasionViewModel(useCase),
      act: (viewModel) => viewModel.doIntent(SelectTabEvent(1)),
      expect: () => [
        const OccasionStates(occasionsState: null, selectedTabIndex: 1),
      ],
    );

    test('selectedOccasion returns correct occasion', () async {
      when(
        mockRepository.getAllOccasions(),
      ).thenAnswer((_) async => SuccessResponse(data: occasions));

      final viewModel = OccasionViewModel(useCase);
      viewModel.doIntent(GetAllOccasionsEvent());

      await Future.delayed(const Duration(milliseconds: 100));

      expect(viewModel.selectedOccasion, occasions[0]);

      viewModel.doIntent(SelectTabEvent(1));
      expect(viewModel.selectedOccasion, occasions[1]);
    });

    test('selectedOccasion returns null when empty', () {
      final viewModel = OccasionViewModel(useCase);
      expect(viewModel.selectedOccasion, isNull);
    });

    test('selectedOccasion returns null when index out of bounds', () async {
      when(
        mockRepository.getAllOccasions(),
      ).thenAnswer((_) async => SuccessResponse(data: occasions));

      final viewModel = OccasionViewModel(useCase);
      viewModel.doIntent(GetAllOccasionsEvent());

      await Future.delayed(const Duration(milliseconds: 100));

      viewModel.doIntent(SelectTabEvent(999));
      expect(viewModel.selectedOccasion, isNull);
    });

    blocTest<OccasionViewModel, OccasionStates>(
      'handles multiple tab selections',
      build: () => OccasionViewModel(useCase),
      act: (viewModel) {
        viewModel.doIntent(SelectTabEvent(1));
        viewModel.doIntent(SelectTabEvent(2));
        return viewModel.doIntent(SelectTabEvent(0));
      },
      expect: () => [
        const OccasionStates(selectedTabIndex: 1),
        const OccasionStates(selectedTabIndex: 2),
        const OccasionStates(selectedTabIndex: 0),
      ],
    );
  });
}
