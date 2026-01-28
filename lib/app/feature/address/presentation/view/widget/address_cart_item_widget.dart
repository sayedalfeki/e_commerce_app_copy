import 'package:flower_app/app/core/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';

import '../../../domain/model/user_address_entity.dart';

class AddressCartItemWidget extends StatefulWidget {
  const AddressCartItemWidget({
    super.key,
    required this.address,
    this.onDeletePressed,
    this.onEditPressed,
  });

  final UserAddressEntity address;
  final void Function()? onDeletePressed;
  final void Function()? onEditPressed;

  @override
  State<AddressCartItemWidget> createState() => _AddressCartItemWidgetState();
}

class _AddressCartItemWidgetState extends State<AddressCartItemWidget> {
  String addressDetails = '';

  @override
  void initState() {
    super.initState();
    getLocationDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Container(
        padding: const EdgeInsets.all(10),

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.whiteColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.location_on_outlined),
                const SizedBox(width: 10),
                Text(
                  widget.address.city ?? '',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.blackColor,
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: widget.onDeletePressed,
                  icon: Icon(
                    Icons.delete_outline,
                    color: AppColors.primaryColor,
                  ),
                ),
                IconButton(
                  onPressed: widget.onEditPressed,
                  icon: const Icon(Icons.edit),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Text(
              addressDetails,
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(color: AppColors.grayColor),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> getLocationDetails() async {
    double lat = double.parse(widget.address.lat ?? '0');
    double lng = double.parse(widget.address.long ?? '0');
    List<Placemark> placemarks = await placemarkFromCoordinates(lat, lng);
    Placemark place = placemarks.first;
    addressDetails = ' ${place.locality}-${place.name}';

    setState(() {});
  }
}
