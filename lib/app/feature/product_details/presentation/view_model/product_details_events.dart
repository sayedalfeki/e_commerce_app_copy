sealed class ProductDetailsEvents {}
class GetProductDetailsEvent extends ProductDetailsEvents{
  String productId;
  GetProductDetailsEvent(this.productId);
}