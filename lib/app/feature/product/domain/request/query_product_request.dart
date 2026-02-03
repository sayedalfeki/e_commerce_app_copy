import 'package:equatable/equatable.dart';

class QueryProductRequest extends Equatable {
  final String? category;
  final String? occasion;

  const QueryProductRequest({this.category, this.occasion});

  Map<String, dynamic> toJson() {
    return {"category": category, "occasion": occasion}
      ..removeWhere((key, value) => value == null);
  }

  @override
  List<Object?> get props => [];
}
