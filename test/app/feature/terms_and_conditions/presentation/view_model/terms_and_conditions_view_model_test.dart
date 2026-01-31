import 'package:flower_app/app/config/base_response/base_response.dart';
import 'package:flower_app/app/feature/terms_and_conditions/data/models/terms_section.dart';
import 'package:flower_app/app/feature/terms_and_conditions/domain/use_cases/get_terms_use_case.dart';
import 'package:flower_app/app/feature/terms_and_conditions/presentation/view_model/terms_and_conditions_events.dart';
import 'package:flower_app/app/feature/terms_and_conditions/presentation/view_model/terms_and_conditions_states.dart';
import 'package:flower_app/app/feature/terms_and_conditions/presentation/view_model/terms_and_conditions_view_model.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'terms_and_conditions_view_model_test.mocks.dart';

@GenerateMocks([GetTermsUseCase])
void main() {
  late TermsAndConditionsViewModel termsAndConditionsViewModel;
  late MockGetTermsUseCase mockGetTermsUseCase;
  setUpAll(() {
    provideDummy<BaseResponse<List<TermsSection>>>(SuccessResponse<List<TermsSection>>(data: []));
    mockGetTermsUseCase=MockGetTermsUseCase();
    termsAndConditionsViewModel=TermsAndConditionsViewModel(mockGetTermsUseCase);
  },);
  tearDownAll(() {
    termsAndConditionsViewModel.close();
  },);
  group('view model test cases', () {
    test('success case with a success response', () {
      final dummySections=[
        TermsSection(section: 'test1', content: {'en': 'test content1'}, style: {'fontSize': 16}),
        TermsSection(section: 'test2', content: {'en': 'test content2'}, style: {'fontSize': 18})
      ];
      when(mockGetTermsUseCase.call()).thenAnswer(
        (_)async => SuccessResponse<List<TermsSection>>(data: dummySections),
      );
      expectLater(
        termsAndConditionsViewModel.stream, 
        emitsInOrder([
          predicate<TermsAndConditionsStates>(
            (state) =>state.getTermsState?.isLoading==true ,
          ),
          predicate<TermsAndConditionsStates>(
            (state) =>state.getTermsState?.isLoading==false && state.getTermsState?.success==dummySections ,
          )
        ])
      );
      termsAndConditionsViewModel.doIntent(GetTermsAndConditionsEvent());
      verify(mockGetTermsUseCase.call()).called(1);
    },);
    test('error case with error response', () {
      final dummyError=Exception('No source found');
      when(mockGetTermsUseCase.call()).thenAnswer(
        (_)async => ErrorResponse<List<TermsSection>>(error: dummyError),
      );
      expectLater(
        termsAndConditionsViewModel.stream, 
        emitsInOrder([
          predicate<TermsAndConditionsStates>(
            (state) =>state.getTermsState?.isLoading==true ,
          ),
          predicate<TermsAndConditionsStates>(
            (state) =>state.getTermsState?.isLoading==false && state.getTermsState?.error==dummyError ,
          )
        ])
      );
      termsAndConditionsViewModel.doIntent(GetTermsAndConditionsEvent());
      verify(mockGetTermsUseCase.call()).called(1);
    },);
  },);
}