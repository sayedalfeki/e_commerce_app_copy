import 'package:flower_app/app/config/api_utils/api_utils.dart';
import 'package:flower_app/app/config/base_response/base_response.dart';
import 'package:flower_app/app/feature/best_seller/api/api_client/best_seller_api_client.dart';
import 'package:flower_app/app/feature/best_seller/data/datasources/remote/best_seller_remote_data_source_contract.dart';
import 'package:flower_app/app/feature/best_seller/data/models/best_seller_response.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: BestSellerRemoteDataSourceContract)
class BestSellerRemoteDataSourceImpl implements BestSellerRemoteDataSourceContract{
  final BestSellerApiClient bestSellerApiClient;
  BestSellerRemoteDataSourceImpl(this.bestSellerApiClient);
  @override
  Future<BaseResponse<BestSellerResponse>> getBestSellers() {
    return executeApi(() => bestSellerApiClient.getBestSellers(),);
  }
}