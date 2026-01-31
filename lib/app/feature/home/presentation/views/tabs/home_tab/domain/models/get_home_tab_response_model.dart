import 'package:flower_app/app/feature/home/presentation/views/tabs/home_tab/domain/models/best_seller_model.dart';
import 'package:flower_app/app/feature/home/presentation/views/tabs/home_tab/domain/models/category_model.dart';
import 'package:flower_app/app/feature/home/presentation/views/tabs/home_tab/domain/models/occasion_model.dart';

class GetHomeTabResponseModel {
  List<CategoryModel>? categories;
  List<BestSellerModel>? bestSellers;
  List<OccasionModel>? occasions;
  GetHomeTabResponseModel({
    this.categories,
    this.bestSellers,
    this.occasions
  });
}