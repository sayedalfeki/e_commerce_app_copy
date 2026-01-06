sealed class OccasionsIntent {}

class AllOccasionsIntent extends OccasionsIntent {}

class GetOccasionIntent extends OccasionsIntent {
  final int index;
  GetOccasionIntent({required this.index});
}

class GetProductsOccasionIntent extends OccasionsIntent {
  final String occasionId;
  GetProductsOccasionIntent({required this.occasionId});
}
