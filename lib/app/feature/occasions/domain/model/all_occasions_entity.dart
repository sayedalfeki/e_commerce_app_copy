class AllOccasionsEntity {
  final List<OccasionEntity>? occasionsEntity;

  AllOccasionsEntity({this.occasionsEntity});
}

class OccasionEntity {
  final String? id;
  final String? title;

  OccasionEntity({this.id, this.title});
}
