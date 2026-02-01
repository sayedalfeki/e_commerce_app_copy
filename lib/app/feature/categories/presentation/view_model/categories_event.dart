sealed class CategoriesEvent {}

class NavigateToProductDetailsEvent extends CategoriesEvent {
  final String productId;

  NavigateToProductDetailsEvent({required this.productId});
}
