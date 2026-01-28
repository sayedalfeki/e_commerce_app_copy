import 'package:flower_app/app/config/di/di.dart';
import 'package:flower_app/app/core/utils/app_locale.dart';
import 'package:flower_app/app/feature/address_details/presentation/view_model/address_details_events.dart';
import 'package:flower_app/app/feature/address_details/presentation/view_model/address_details_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class AddressDetailsScreen extends StatelessWidget{
  String? addressId;
  AddressDetailsScreen({super.key, this.addressId});

  AddressDetailsViewmodel viewmodel = getIt<AddressDetailsViewmodel>();

  @override
  Widget build(BuildContext context) {
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
                      initialValue: viewmodel.address,
                      readOnly: true,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: AppLocale(context).address,
                      ),
                      initialValue: viewmodel.address,
                      readOnly: true,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: AppLocale(context).address,
                      ),
                      initialValue: viewmodel.address,
                      readOnly: true,
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