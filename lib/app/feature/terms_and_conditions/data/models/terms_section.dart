import 'package:flower_app/app/core/keys/local_json_keys.dart';

class TermsSection {
  String section;
  Map<String,dynamic> content;
  Map<String,dynamic>? title;
  Map<String,dynamic> style;
  TermsSection({required this.section,required this.content,this.title,required this.style});
  factory TermsSection.fromJson(Map<String,dynamic> json){
    return TermsSection(
      section: json[LocalJsonKeys.section] as String, 
      content: Map<String,dynamic>.from(json[LocalJsonKeys.content]),
      title: json[LocalJsonKeys.title] != null?Map<String,dynamic>.from(json[LocalJsonKeys.title]):null, 
      style: Map<String,dynamic>.from(json[LocalJsonKeys.style])
    );
  }
}