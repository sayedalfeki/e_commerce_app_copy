import 'package:flower_app/app/feature/terms_and_conditions/presentation/views/widget/terms_text_widget.dart';
import 'package:flutter/material.dart';

class TermsContentWidget extends StatelessWidget {
  final dynamic content;
  final Map<String, dynamic> style;
  final String language;
  const TermsContentWidget({super.key, required this.content, required this.style, required this.language});

  @override
  Widget build(BuildContext context) {
    if(content==null){
      return const SizedBox();
    }
    if(content is String){
      return TermsTextWidget(
        text: content as String, 
        style: style, 
        language: language);
    }
    if(content is List){
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: 
          (content as List).map<Widget>((item) {
            return TermsTextWidget(text: item.toString(), style: style, language: language);
          },).toList()
        ,
      );
    }
    return const SizedBox();
  }
}