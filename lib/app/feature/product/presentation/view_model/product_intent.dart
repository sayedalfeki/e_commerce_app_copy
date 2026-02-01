sealed class ProductIntent {}

class GetProductDetailsAction extends ProductIntent {
  String productId;

  GetProductDetailsAction(this.productId);
}

class NavigateToProductDetailsAction extends ProductIntent {
  final String? productId;

  NavigateToProductDetailsAction({required this.productId});
}

class AddToCartAction extends ProductIntent {
  final String? productId;
  final String? name;

  AddToCartAction({required this.productId, required this.name});
}