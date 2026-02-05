sealed class OccasionProductsEvents {}

class GetProductsForOccasionEvent extends OccasionProductsEvents {
  final String occasionId;
  GetProductsForOccasionEvent(this.occasionId);
}
