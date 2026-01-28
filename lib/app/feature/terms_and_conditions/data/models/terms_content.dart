import 'package:flower_app/app/feature/terms_and_conditions/data/models/terms_section.dart';

class TermsContent {
  List<TermsSection> termsAndConditions;
  TermsContent({required this.termsAndConditions});
  factory TermsContent.fromJson(Map<String,dynamic> json){
    final sections=(json["terms_and_conditions"] as List).map(
      (e) => TermsSection.fromJson(e),
    ).toList();
    return TermsContent(termsAndConditions: sections);
  }
}