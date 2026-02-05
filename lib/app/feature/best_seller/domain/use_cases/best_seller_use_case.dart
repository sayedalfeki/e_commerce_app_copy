import 'package:flower_app/app/config/base_response/base_response.dart';
import 'package:flower_app/app/feature/best_seller/domain/models/best_seller_model.dart';
import 'package:flower_app/app/feature/best_seller/domain/repos/best_seller_repo_contract.dart';
import 'package:injectable/injectable.dart';
@injectable
class BestSellerUseCase {
  final BestSellerRepoContract bestSellerRepoContract;
  BestSellerUseCase(this.bestSellerRepoContract);
  Future<BaseResponse<List<BestSellerModel>>> call()async{
    return bestSellerRepoContract.getBestSellers();
  }
}