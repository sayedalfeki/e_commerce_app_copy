import 'package:flower_app/app/feature/terms_and_conditions/data/models/terms_section.dart';
import 'package:flower_app/app/feature/terms_and_conditions/presentation/views/widget/terms_content_widget.dart';
import 'package:flower_app/app/feature/terms_and_conditions/presentation/views/widget/terms_text_widget.dart';
import 'package:flutter/material.dart';

class TermsSectionWidget extends StatelessWidget {
  final TermsSection section;
  final String language;
  const TermsSectionWidget({super.key, required this.section, required this.language});

  @override
  Widget build(BuildContext context) {
    final children = <Widget>[];
    if(section.title != null && section.title!.containsKey(language)) {
      children.add(
        TermsTextWidget(
          text: section.title![language]!, 
          style: section.style['title'] ?? section.style, 
          language: language
        )
      );
    } 
    if(section.content.containsKey(language)) {
      children.add(
        TermsContentWidget(
          content: section.content[language], 
          style: _getContentStyle(),
          language: language
        )
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    );
  }
  Map<String,dynamic> _getContentStyle(){
    if(section.style.containsKey('content')){
      return section.style['content'] as Map<String, dynamic>;
    }else{
      return section.style;
    }
  }
}