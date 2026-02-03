import 'package:flower_app/app/config/base_response/base_response.dart';
import 'package:flower_app/app/feature/address/data/address_data_source.dart';
import 'package:flower_app/app/feature/address/data/model/user_address_response.dart';
import 'package:flower_app/app/feature/address/domain/address_repo_contract.dart';
import 'package:flower_app/app/feature/address/domain/model/user_address_entity.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AddressRepoContract)
class AddressRepoImpl extends AddressRepoContract {
  final AddressDataSource _addressDataSource;

  AddressRepoImpl(this._addressDataSource);

  @override
  Future<BaseResponse<List<UserAddressEntity>>> getUserAddresses() async {
    final response = await _addressDataSource.getUserAddresses();
    switch (response) {
      case SuccessResponse<UserAddressResponse>():
        List<UserAddressEntity>? addresses = response.data.addresses?.map((e) {
          return response.data.toUserAddressEntity(e);
        }).toList();
        return SuccessResponse(data: addresses ?? []);
      case ErrorResponse<UserAddressResponse>():
        return ErrorResponse(error: response.error);
    }
  }

  @override
  Future<BaseResponse<List<UserAddressEntity>>> deleteUserAddress(
    String id,
  ) async {
    final response = await _addressDataSource.deleteUserAddress(id);
    switch (response) {
      case SuccessResponse<UserAddressResponse>():
        List<UserAddressEntity>? addresses = response.data.addresses?.map((e) {
          return response.data.toUserAddressEntity(e);
        }).toList();
        return SuccessResponse(data: addresses ?? []);
      case ErrorResponse<UserAddressResponse>():
        return ErrorResponse(error: response.error);
    }
  }
}
