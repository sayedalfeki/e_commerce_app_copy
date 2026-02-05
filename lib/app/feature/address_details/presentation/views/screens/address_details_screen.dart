import 'package:flower_app/app/feature/address/domain/model/user_address_entity.dart';
import 'package:flutter/material.dart';

class AddressDetailsScreen extends StatefulWidget {
  final UserAddressEntity? userAddressEntity;
  const AddressDetailsScreen({super.key,this.userAddressEntity});

  @override
  State<AddressDetailsScreen> createState() => _AddressDetailsScreenState();
}

class _AddressDetailsScreenState extends State<AddressDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}