import 'dart:io';

import 'package:flower_app/app/config/base_error/custom_exceptions.dart';
import 'package:flower_app/app/config/base_response/base_response.dart';
import 'package:flower_app/app/feature/address/api/address_client.dart';
import 'package:flower_app/app/feature/address/api/address_data_source_impl.dart';
import 'package:flower_app/app/feature/address/data/model/user_address_response.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'address_data_source_impl_test.mocks.dart';

@GenerateMocks([AddressApiClient])
void main() {
  late AddressDataSourceImpl addressDataSource;
  late AddressApiClient addressApiClient;
  late UserAddressResponse userAddressResponse;
  setUpAll(() {
    addressApiClient = MockAddressApiClient();
    addressDataSource = AddressDataSourceImpl(addressApiClient);
    userAddressResponse = UserAddressResponse(
      message: 'success',
      addresses: [AddressesDto(city: 'cairo', lat: '123', long: '123')],
    );
  });
  group('get user addresses', () {
    test(
      'when calling get user addresses with success it must return data',
      () async {
        when(
          addressApiClient.getUserAddresses(),
        ).thenAnswer((_) async => userAddressResponse);
        final response =
            await addressDataSource.getUserAddresses()
                as SuccessResponse<UserAddressResponse>;
        expect(response.data, userAddressResponse);
      },
    );
    test(
      'when calling get user addresses with failure it must return error',
      () async {
        when(addressApiClient.getUserAddresses()).thenThrow(IOException);
        final response =
            await addressDataSource.getUserAddresses()
                as ErrorResponse<UserAddressResponse>;
        expect(response.error, UnexpectedError());
      },
    );
  });
  group('delete user address', () {
    test(
      'when calling delete user address with success it must return data',
      () async {
        when(
          addressApiClient.deleteUserAddresses('1'),
        ).thenAnswer((_) async => userAddressResponse);
        final response =
            await addressDataSource.deleteUserAddress('1')
                as SuccessResponse<UserAddressResponse>;
        expect(response.data, userAddressResponse);
      },
    );
    test(
      'when calling delete user address with failure it must return error',
      () async {
        when(addressApiClient.deleteUserAddresses('1')).thenThrow(IOException);
        final response =
            await addressDataSource.deleteUserAddress('1')
                as ErrorResponse<UserAddressResponse>;
        expect(response.error, UnexpectedError());
      },
    );
  });
}
