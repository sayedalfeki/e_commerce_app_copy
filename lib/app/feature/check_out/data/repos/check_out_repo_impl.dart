import 'package:flower_app/app/config/base_response/base_response.dart';
import 'package:flower_app/app/feature/check_out/data/data_sources/remote/check_out_remote_data_source_contract.dart';
import 'package:flower_app/app/feature/check_out/data/models/address_dto.dart';
import 'package:flower_app/app/feature/check_out/data/models/user_address_response.dart';
import 'package:flower_app/app/feature/check_out/domain/models/address_model.dart';
import 'package:flower_app/app/feature/check_out/domain/repos/check_out_repo_contract.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: CheckOutRepoContract)
class CheckOutRepoImpl implements CheckOutRepoContract{
  CheckOutRemoteDataSourceContract checkOutRemoteDataSourceContract;
  CheckOutRepoImpl(this.checkOutRemoteDataSourceContract);
  @override
  Future<BaseResponse<List<AddressModel>>> getUserAddresses() async{
    final response=await checkOutRemoteDataSourceContract.getUserAddressesResponse();
    switch(response){
      case SuccessResponse<UserAddressResponse>():
        List<AddressDTO> dtos=response.data.addresses!;
        List<AddressModel> addresses=dtos.map((e) => e.toDomain(),).toList();
        return SuccessResponse<List<AddressModel>>(data: addresses); 
      case ErrorResponse<UserAddressResponse>():
        return ErrorResponse<List<AddressModel>>(error: response.error);
    }
  }

}