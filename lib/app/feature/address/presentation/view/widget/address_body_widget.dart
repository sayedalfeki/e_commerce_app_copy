import 'package:flower_app/app/core/utils/app_locale.dart';
import 'package:flower_app/app/core/utils/helper_function.dart';
import 'package:flower_app/app/feature/address/presentation/view_model/address_state.dart';
import 'package:flower_app/app/feature/address/presentation/view_model/address_view_model.dart';
import 'package:flutter/material.dart';

import '../../view_model/address_intent.dart';
import 'address_cart_item_widget.dart';

class AddressBodyWidget extends StatelessWidget {
  const AddressBodyWidget({
    super.key,
    required this.addressState,
    required this.addressViewModel,
  });

  final AddressState addressState;
  final AddressViewModel addressViewModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          addressState.addressState.isLoading == true
              ? const Center(child: CircularProgressIndicator())
              : addressState.addressState.success != null
              ? Flexible(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: addressState.addressState.success?.length,
                    itemBuilder: (context, index) {
                      return AddressCartItemWidget(
                        address: addressState.addressState.success![index],
                        onDeletePressed: () {
                          addressViewModel.doIntent(
                            DeleteUserAddressAction(
                              addressState
                                      .addressState
                                      .success![index]
                                      .addressId ??
                                  '',
                            ),
                          );
                        },
                        onEditPressed: () {
                          addressViewModel.doIntent(
                            UpdateUserAddressAction(
                              address:
                                  addressState.addressState.success![index],
                            ),
                          );
                        },
                      );
                    },
                  ),
                )
              : addressState.addressState.error != null
              ? Text(getException(context, addressState.addressState.error!))
              : Text(AppLocale(context).someThingWrong),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              addressViewModel.doIntent(UpdateUserAddressAction());
            },
            child: Text(
              AppLocale(context).addNewAddress,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ],
      ),
    );
  }
}
