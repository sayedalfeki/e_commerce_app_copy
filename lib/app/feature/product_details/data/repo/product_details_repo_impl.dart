import 'package:flower_app/app/config/base_response/base_response.dart';
import 'package:flower_app/app/feature/product_details/data/data_sources/product_details_remote_data_source_contract.dart';
import 'package:flower_app/app/feature/product_details/data/models/product_details_dto.dart';
import 'package:flower_app/app/feature/product_details/domain/models/product_details_model.dart';
import 'package:flower_app/app/feature/product_details/domain/repo/product_details_repo_contract.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProductDetailsRepoContract)
class ProductDetailsRepoImpl implements ProductDetailsRepoContract{
  ProductDetailsRemoteDataSourceContract productDetailsRemoteDataSourceContract;
  ProductDetailsRepoImpl(this.productDetailsRemoteDataSourceContract);
  @override
  Future<BaseResponse<ProductDetailsModel>> getProductDetails(String productId) async{
    var response =await productDetailsRemoteDataSourceContract.getProductDetails(productId);
    switch(response){
      case SuccessResponse<ProductDetailsDto>():
        ProductDetailsModel productDetailsModel = response.data.toModel();
        return SuccessResponse<ProductDetailsModel>(data: productDetailsModel);
      case ErrorResponse<ProductDetailsDto>():
        return ErrorResponse<ProductDetailsModel>(error: response.error);
    }
  }
}