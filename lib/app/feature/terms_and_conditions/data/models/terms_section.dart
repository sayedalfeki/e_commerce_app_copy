class TermsSection {
  String section;
  Map<String,dynamic> content;
  Map<String,dynamic>? title;
  Map<String,dynamic> style;
  TermsSection({required this.section,required this.content,this.title,required this.style});
  factory TermsSection.fromJson(Map<String,dynamic> json){
    return TermsSection(
      section: json['section'] as String, 
      content: Map<String,dynamic>.from(json['content']),
      title: json['title'] != null?Map<String,dynamic>.from(json['title']):null, 
      style: Map<String,dynamic>.from(json['style'])
    );
  }
}