import 'package:flower_app/app/config/base_response/base_response.dart';
import 'package:flower_app/app/feature/best_seller/data/models/best_seller_response.dart';

abstract class BestSellerRemoteDataSourceContract {
  Future<BaseResponse<BestSellerResponse>> getBestSellers();
}