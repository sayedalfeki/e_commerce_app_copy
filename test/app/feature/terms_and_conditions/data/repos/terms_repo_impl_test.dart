import 'package:flower_app/app/config/base_response/base_response.dart';
import 'package:flower_app/app/feature/terms_and_conditions/data/data_sources/local/local_terms_data_source_impl.dart';
import 'package:flower_app/app/feature/terms_and_conditions/data/models/terms_content.dart';
import 'package:flower_app/app/feature/terms_and_conditions/data/models/terms_section.dart';
import 'package:flower_app/app/feature/terms_and_conditions/data/repos/terms_repo_impl.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'terms_repo_impl_test.mocks.dart';

@GenerateMocks([LocalTermsDataSourceImpl])
void main() {
  late TermsRepoImpl termsRepoImpl;
  late MockLocalTermsDataSourceImpl mockLocalTermsDataSourceImpl;
  setUpAll(() {
    provideDummy<BaseResponse<TermsContent>>(SuccessResponse<TermsContent>(data: TermsContent(termsAndConditions: [])));
    mockLocalTermsDataSourceImpl=MockLocalTermsDataSourceImpl();
    termsRepoImpl=TermsRepoImpl(mockLocalTermsDataSourceImpl);
  },);
  group('getTermsAndConditions test cases', () {
      test('success case with list of terms sections', () async{
        final dummySections=[
          TermsSection(section: 'test1', content: {'en': 'test content1'}, style: {'fontSize': 16}),
          TermsSection(section: 'test2', content: {'en': 'test content2'}, style: {'fontSize': 18})
        ];
        when(mockLocalTermsDataSourceImpl.getTermsAndConditions()).thenAnswer(
          (_)async => SuccessResponse<TermsContent>(data: TermsContent(termsAndConditions: dummySections)),
        );
        final result=await termsRepoImpl.getTermsAndConditions();
        expect(result, isA<SuccessResponse<List<TermsSection>>>());
        expect((result as SuccessResponse<List<TermsSection>>).data.length, equals(dummySections.length));
        expect(result.data[0].section, equals(dummySections[0].section));
        expect(result.data[0].title, isNull);
        expect(result.data[0].content['en'],equals(dummySections[0].content['en']));
        expect(result.data[0].style['fontSize'],equals(dummySections[0].style['fontSize']));
        expect(result.data[1].section, equals(dummySections[1].section));
        expect(result.data[1].content['en'],equals(dummySections[1].content['en']));
        expect(result.data[1].style['fontSize'],equals(dummySections[1].style['fontSize']));
        verify(mockLocalTermsDataSourceImpl.getTermsAndConditions()).called(1);
      },);
      test('failure case with exception', () async{
        final dummyError=Exception('No source found');
        when(mockLocalTermsDataSourceImpl.getTermsAndConditions()).thenAnswer(
          (_) async=> ErrorResponse<TermsContent>(error: dummyError),
        );
        final result=await termsRepoImpl.getTermsAndConditions();
        expect(result, isA<ErrorResponse<List<TermsSection>>>());
        expect((result as ErrorResponse<List<TermsSection>>).error.toString(), equals(dummyError.toString()));
        verify(mockLocalTermsDataSourceImpl.getTermsAndConditions()).called(1);
      },);
    },);
}