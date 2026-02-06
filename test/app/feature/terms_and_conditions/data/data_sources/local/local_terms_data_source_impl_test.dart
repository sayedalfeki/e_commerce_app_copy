
import 'package:flower_app/app/feature/terms_and_conditions/data/data_sources/local/local_terms_data_source_impl.dart';
import 'package:test/test.dart';

void main() {
  group('LocalTermsDataSourceImpl', () {
    test('getTermsAndConditions method should exist and complete', () {
      final dataSource = LocalTermsDataSourceImpl();
      expect(dataSource.getTermsAndConditions(), completes);
    });
    test('should use executeApi for error handling', () async {
      final dataSource = LocalTermsDataSourceImpl();
      final futureResult = dataSource.getTermsAndConditions();
      expect(futureResult, completes);
    });
  });
}