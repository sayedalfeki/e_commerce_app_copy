sealed class ProductEvent {}

class NavigateToProductDetailsEvent extends ProductEvent {
  final String productId;

  NavigateToProductDetailsEvent({required this.productId});
}

class BackNavigationFromProductEvent extends ProductEvent {}

class AddToCartEvent extends ProductEvent {
  final String? productId;
  final String? name;

  AddToCartEvent({required this.productId, required this.name});
}
