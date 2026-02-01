sealed class CategoriesIntent {}

class CategoriesAction extends CategoriesIntent {}

class GetCategoryIntent extends CategoriesIntent {
  final int index;

  GetCategoryIntent({required this.index});
}

class GetProductsCategoryIntent extends CategoriesIntent {
  final String categoryId;

  GetProductsCategoryIntent({required this.categoryId});
}

class NavigateToProductDetailsIntent extends CategoriesIntent {
  final String productId;

  NavigateToProductDetailsIntent({required this.productId});
}
