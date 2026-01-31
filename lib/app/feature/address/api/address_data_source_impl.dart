import 'package:flower_app/app/config/api_utils/api_utils.dart';
import 'package:flower_app/app/config/base_response/base_response.dart';
import 'package:flower_app/app/feature/address/api/address_client.dart';
import 'package:flower_app/app/feature/address/data/address_data_source.dart';
import 'package:flower_app/app/feature/address/data/model/user_address_response.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AddressDataSource)
class AddressDataSourceImpl extends AddressDataSource {
  final AddressApiClient _addressApiClient;

  AddressDataSourceImpl(this._addressApiClient);

  @override
  Future<BaseResponse<UserAddressResponse>> getUserAddresses() =>
      executeApi(() => _addressApiClient.getUserAddresses());

  @override
  Future<BaseResponse<UserAddressResponse>> deleteUserAddress(String id) =>
      executeApi(() => _addressApiClient.deleteUserAddresses(id));
}
