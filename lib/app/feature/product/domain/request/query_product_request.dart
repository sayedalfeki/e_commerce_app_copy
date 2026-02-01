class QueryProductRequest {
  String? category;
  String? occasion;

  QueryProductRequest({this.category, this.occasion});

  Map<String, dynamic> toJson() {
    return {"category": category, "occasion": occasion}
      ..removeWhere((key, value) => value == null);
  }
}
