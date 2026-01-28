import 'package:flower_app/app/config/di/di.dart';
import 'package:flower_app/app/core/utils/app_locale.dart';
import 'package:flower_app/app/feature/address/domain/model/user_address_entity.dart';
import 'package:flower_app/app/feature/address_details/presentation/view_model/address_details_events.dart';
import 'package:flower_app/app/feature/address_details/presentation/view_model/address_details_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class AddressDetailsScreen extends StatelessWidget{
  UserAddressEntity? userAddressEntity;
  AddressDetailsScreen({super.key, this.userAddressEntity});

  AddressDetailsViewmodel viewmodel = getIt<AddressDetailsViewmodel>();

  @override
  Widget build(BuildContext context) {
    if (userAddressEntity != null) {
      viewmodel.doIntent(getAddressFromCoordinatesEvent(
        latitude: double.parse(userAddressEntity!.lat!),
        longitude: double.parse(userAddressEntity!.long!)
      ));
    }
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocale(context).addressdetails,style: Theme.of(context).textTheme.headlineLarge,),

      ),
      body: BlocProvider<AddressDetailsViewmodel>(create: (context) => viewmodel,
      child: BlocConsumer(
        builder: (context, state) {
          return Padding(padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              FlutterMap( 

               options: MapOptions(
                 initialCenter: LatLng(51.509364, -0.128928), // Center the map over London, UK
                 initialZoom: 9.2,
                 onTap: (tapPosition, point) {
                   viewmodel.doIntent(getAddressFromCoordinatesEvent(
                    latitude: point.latitude,
                    longitude: point.longitude
                   ));
                 },
               ),

               children: [
                 TileLayer( // Bring your own tiles
                   urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png', // For demonstration only
                   
                 ),
                 RichAttributionWidget( // Include a stylish prebuilt attribution widget that meets all requirments
                   attributions: [
                     TextSourceAttribution(
                       'OpenStreetMap contributors',
                       onTap: () => launchUrl(Uri.parse('https://openstreetmap.org/copyright')), // (external)
                     ),
                     // Also add images...
                   ],
                 ),
               ],
              ),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: AppLocale(context).address,
                      ),
                      initialValue: userAddressEntity==null?null: viewmodel.address,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return AppLocale(context).pleaseEnterYourAddress;
                        }
                        return null;
                      },
                      onChanged: (value) {
                        viewmodel.address = value;
                        formKey.currentState?.validate();
                      },
                      
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: AppLocale(context).phoneNumber,
                      ),
                      initialValue: userAddressEntity?.phone??null ,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return AppLocale(context).pleaseEnterYourPhoneNumber;
                        }
                        return null;
                      },
                      onChanged: (value) {
                        viewmodel.phone = value;
                        formKey.currentState?.validate();
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: AppLocale(context).recipientName,
                      ),
                      initialValue: userAddressEntity?.recipientName??null ,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return AppLocale(context).pleaseEnterYourPhoneNumber;
                        }
                        return null;
                      },
                      onChanged: (value) {
                        viewmodel.phone = value;
                        formKey.currentState?.validate();
                      },
                    ),
                    Row(children: [
                      Expanded(
                        child: DropdownMenu(dropdownMenuEntries: [
                          DropdownMenuEntry(value: 'Home', label: AppLocale(context).home),
                          DropdownMenuEntry(value: 'Work', label: AppLocale(context).work),
                          DropdownMenuEntry(value: 'Other', label: AppLocale(context).other),
                        ], label: AppLocale(context).addressType,)
                      ),
                    Expanded(
                        child: DropdownMenu(dropdownMenuEntries: [
                          DropdownMenuEntry(value: 'Home', label: AppLocale(context).home),
                          DropdownMenuEntry(value: 'Work', label: AppLocale(context).work),
                          DropdownMenuEntry(value: 'Other', label: AppLocale(context).other),
                        ], label: AppLocale(context).addressType,)
                      ),
                    ],)
                  ],
                )
                )   
            ],
          ),
          );
        },
        listener: (context, state) {
          
        },
        
       ),
      ),
    );
  }

}