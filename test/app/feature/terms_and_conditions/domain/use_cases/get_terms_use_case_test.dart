import 'package:flower_app/app/config/base_response/base_response.dart';
import 'package:flower_app/app/feature/terms_and_conditions/data/models/terms_section.dart';
import 'package:flower_app/app/feature/terms_and_conditions/data/repos/terms_repo_impl.dart';
import 'package:flower_app/app/feature/terms_and_conditions/domain/use_cases/get_terms_use_case.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'get_terms_use_case_test.mocks.dart';

@GenerateMocks([TermsRepoImpl])
void main() {
  late GetTermsUseCase getTermsUseCase;
  late MockTermsRepoImpl mockTermsRepoImpl;
  setUpAll(() {
    provideDummy<BaseResponse<List<TermsSection>>>(SuccessResponse<List<TermsSection>>(data: []));
    mockTermsRepoImpl=MockTermsRepoImpl();
    getTermsUseCase=GetTermsUseCase(mockTermsRepoImpl);
  },);
  group('GetTermsUseCase test cases',() {
    test('checking that call function working properly', () async{
      final dummySections=[
        TermsSection(section: 'test1', content: {'en': 'test content1'}, style: {'fontSize': 16}),
        TermsSection(section: 'test2', content: {'en': 'test content2'}, style: {'fontSize': 18})
      ];
      when(mockTermsRepoImpl.getTermsAndConditions()).thenAnswer(
        (_)async => SuccessResponse<List<TermsSection>>(data: dummySections),
      );
      final result=await getTermsUseCase.call();
      expect(result, isA<SuccessResponse<List<TermsSection>>>());
      expect((result as SuccessResponse<List<TermsSection>>).data.length, equals(dummySections.length));
      expect(result.data[0].section, equals(dummySections[0].section));
      expect(result.data[0].title, isNull);
      expect(result.data[0].content['en'],equals(dummySections[0].content['en']));
      expect(result.data[0].style['fontSize'],equals(dummySections[0].style['fontSize']));
      expect(result.data[1].section, equals(dummySections[1].section));
      expect(result.data[1].content['en'],equals(dummySections[1].content['en']));
      expect(result.data[1].style['fontSize'],equals(dummySections[1].style['fontSize']));
      verify(mockTermsRepoImpl.getTermsAndConditions()).called(1);
    },);
    test('failure case with exception', () async{
      final dummyError=Exception('No source found');
      when(mockTermsRepoImpl.getTermsAndConditions()).thenAnswer(
        (_)async => ErrorResponse<List<TermsSection>>(error: dummyError),
      );
      final result=await getTermsUseCase.call();
      expect(result, isA<ErrorResponse<List<TermsSection>>>());
      expect((result as ErrorResponse<List<TermsSection>>).error.toString(), equals(dummyError.toString()));
      verify(mockTermsRepoImpl.getTermsAndConditions()).called(1);
    },);
  }, );
}