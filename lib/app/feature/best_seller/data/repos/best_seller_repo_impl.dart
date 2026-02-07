import 'package:flower_app/app/config/base_response/base_response.dart';
import 'package:flower_app/app/feature/best_seller/data/datasources/remote/best_seller_remote_data_source_contract.dart';
import 'package:flower_app/app/feature/best_seller/data/models/best_seller_dto.dart';
import 'package:flower_app/app/feature/best_seller/data/models/best_seller_response.dart';
import 'package:flower_app/app/feature/best_seller/domain/models/best_seller_model.dart';
import 'package:flower_app/app/feature/best_seller/domain/repos/best_seller_repo_contract.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: BestSellerRepoContract)
class BestSellerRepoImpl implements BestSellerRepoContract{
  final BestSellerRemoteDataSourceContract bestSellerRemoteDataSourceContract;
  BestSellerRepoImpl(this.bestSellerRemoteDataSourceContract);
  @override
  Future<BaseResponse<List<BestSellerModel>>> getBestSellers() async{
    final response=await bestSellerRemoteDataSourceContract.getBestSellers();
    switch(response){
      
      case SuccessResponse<BestSellerResponse>():
        List<BestSellerDTO> dtos=response.data.bestSeller!;
        List<BestSellerModel> bestSellers=dtos.map((e) => e.toDomain(),).toList();
        return SuccessResponse<List<BestSellerModel>>(data: bestSellers);
      case ErrorResponse<BestSellerResponse>():
        return ErrorResponse<List<BestSellerModel>>(error: response.error);
    }
  }

}