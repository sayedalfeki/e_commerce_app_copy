import 'package:flower_app/app/config/base_response/base_response.dart';

import 'package:flower_app/app/feature/address/data/address_data_source.dart';
import 'package:flower_app/app/feature/address/data/address_repo_impl.dart';
import 'package:flower_app/app/feature/address/data/model/user_address_response.dart';
import 'package:flower_app/app/feature/address/domain/model/user_address_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'address_repo_impl_test.mocks.dart';

@GenerateMocks([AddressDataSource])
void main() {
  late AddressRepoImpl addressRepoImpl;
  late AddressDataSource addressDataSource;
  late UserAddressEntity userAddressEntity;
  late UserAddressResponse userAddressResponse;
  setUpAll(() {
    addressDataSource = MockAddressDataSource();
    addressRepoImpl = AddressRepoImpl(addressDataSource);
    userAddressEntity = UserAddressEntity(
      city: 'cairo',
      lat: '123',
      long: '123',
    );
    userAddressResponse = UserAddressResponse(
      message: 'success',
      addresses: [AddressesDto(city: 'cairo', lat: '123', long: '123')],
    );
  });

  test('when calling get user addresses it must call data source', () async {
    provideDummy<BaseResponse<UserAddressResponse>>(
      SuccessResponse(data: userAddressResponse),
    );
    when(
      addressDataSource.getUserAddresses(),.thenAnswer(
      (_) => Future.value(SuccessResponse(data: userAddressResponse)),
    );
    await addressRepoImpl.getUserAddresses();

    verify(addressDataSource.getUserAddresses());
  });
  test('when calling delete user addresses it must call data source', () async {
    provideDummy<BaseResponse<UserAddressResponse>>(
      SuccessResponse(data: userAddressResponse),
    );
    when(
      addressDataSource.deleteUserAddress('1'),
    ).thenAnswer((_) =>
        Future.value(SuccessResponse(data: userAddressResponse)));
    await addressRepoImpl.deleteUserAddress('1');

    verify(addressDataSource.deleteUserAddress('1'));
  });
}
