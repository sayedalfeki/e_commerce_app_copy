import 'package:flower_app/app/core/resources/font_manager.dart';
import 'package:flutter/material.dart';

class TermsTextWidget extends StatelessWidget {
  final String text;
  final Map<String, dynamic> style;
  final String language;
  const TermsTextWidget({super.key, required this.text, required this.style, required this.language});

  @override
  Widget build(BuildContext context) {
    return Text(text,style: _parseTextStyle(),textAlign: _parseTextAlign(),);
  }
  TextStyle? _parseTextStyle(){
    return TextStyle(
      fontSize: (style['fontSize'] as num?)?.toDouble() ?? 16,
      fontWeight: _parseFontWeight(style['fontWeight'] as String?),
      color: _parseColor(style['color'] as String?)
    );
  }
  FontWeight? _parseFontWeight(String? fontWeight){
    if(fontWeight=='bold'){
      return FontWeights.bold;
    }else{
      return FontWeight.normal;
    }
  }
  TextAlign? _parseTextAlign(){
    final alignMap = style['textAlign'];
    if(alignMap is Map && alignMap.containsKey(language)){
      final align=alignMap[language];
      switch (align) {
        case 'left': return TextAlign.left;
        case 'right': return TextAlign.right;
        case 'center': return TextAlign.center;
        case 'justify': return TextAlign.justify;
        default: return null;
      }
    }
    return null;
  }
  Color? _parseColor(String? hexColor){
    try{
      if (hexColor == null){
        return null;
      }
      return Color(int.parse(hexColor.replaceFirst('#', '0XFF')));
    }catch(e){
      return null;
    }
  }
}