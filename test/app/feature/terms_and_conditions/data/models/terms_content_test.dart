import 'package:flower_app/app/feature/terms_and_conditions/data/models/terms_content.dart';
import 'package:flower_app/app/feature/terms_and_conditions/data/models/terms_section.dart';
import 'package:test/test.dart';

void main() {
  group('TermsContent cases', () {
    test('should parse JSON into list of TermsSection', () {
      final json = {
        'terms_and_conditions': [
          {
            'section': 'test1',
            'content': {'en': 'test content1'},
            'style': {'fontSize': 16}
          },
          {
            'section': 'test2',
            'content': {'en': 'test content2'},
            'style': {'fontSize': 18}
          },
        ]
      };
      final result=TermsContent.fromJson(json);
      expect(result, isA<TermsContent>());
      expect(result.termsAndConditions, isA<List<TermsSection>>());
      expect(result.termsAndConditions.length, json['terms_and_conditions']?.length);
      expect(result.termsAndConditions[0].section, equals(json['terms_and_conditions']![0]['section']));
      expect(result.termsAndConditions[0].content, equals(json['terms_and_conditions']![0]['content']));
      expect(result.termsAndConditions[0].style, equals(json['terms_and_conditions']![0]['style']));
      expect(result.termsAndConditions[1].section, equals(json['terms_and_conditions']![1]['section']));
      expect(result.termsAndConditions[1].content, equals(json['terms_and_conditions']![1]['content']));
      expect(result.termsAndConditions[1].style, equals(json['terms_and_conditions']![1]['style']));
    },);
    test('fromJson should handle empty terms list', () {
      final emptyJson = {
        'terms_and_conditions': []
      };
      final termsContent = TermsContent.fromJson(emptyJson);
      expect(termsContent.termsAndConditions, isEmpty);
    });
  },);
}