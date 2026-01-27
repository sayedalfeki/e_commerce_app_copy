import 'package:equatable/equatable.dart';
import 'package:flower_app/app/config/base_state/base_state.dart';
import 'package:flower_app/app/feature/address/domain/model/user_address_entity.dart';

class AddressState extends Equatable {
  final BaseState<List<UserAddressEntity>> addressState;

  const AddressState({required this.addressState});

  AddressState copyWith({BaseState<List<UserAddressEntity>>? addressState}) {
    return AddressState(
      addressState: BaseState(
        success: addressState?.success ?? this.addressState.success,
        error: addressState?.error ?? this.addressState.error,
        isLoading: addressState?.isLoading ?? this.addressState.isLoading,
      ),
    );
  }

  @override
  List<Object?> get props => [addressState];
}
