class AboutSection {
  String section;
  Map<String,dynamic> content;
  Map<String,dynamic>? title;
  Map<String,dynamic> style;
  AboutSection({required this.section,required this.content,this.title,required this.style});
  factory AboutSection.fromJson(Map<String,dynamic> json){
    return AboutSection(
      section: json['section'] as String, 
      content: Map<String,dynamic>.from(json['content']),
      title: json['title'] != null?Map<String,dynamic>.from(json['title']):null, 
      style: Map<String,dynamic>.from(json['style'])
    );
  }
}