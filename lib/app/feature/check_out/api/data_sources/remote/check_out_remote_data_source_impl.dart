import 'package:flower_app/app/config/api_utils/api_utils.dart';
import 'package:flower_app/app/config/base_response/base_response.dart';
import 'package:flower_app/app/feature/check_out/api/api_client/check_out_api_client.dart';
import 'package:flower_app/app/feature/check_out/data/data_sources/remote/check_out_remote_data_source_contract.dart';
import 'package:flower_app/app/feature/check_out/data/models/user_address_response.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: CheckOutRemoteDataSourceContract)
class CheckOutRemoteDataSourceImpl implements CheckOutRemoteDataSourceContract{
  CheckOutApiClient checkOutApiClient;
  CheckOutRemoteDataSourceImpl(this.checkOutApiClient);
  @override
  Future<BaseResponse<UserAddressResponse>> getUserAddressesResponse() {
    return executeApi(() => checkOutApiClient.getUserAddresses(),);
  }
}