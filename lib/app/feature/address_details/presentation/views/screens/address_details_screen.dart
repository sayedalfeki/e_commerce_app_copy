
import 'package:flower_app/app/config/di/di.dart';
import 'package:flower_app/app/core/reusable_widgets/show_dialog_utils.dart';
import 'package:flower_app/app/core/utils/app_locale.dart';
import 'package:flower_app/app/core/validation/app_validators.dart';
import 'package:flower_app/app/feature/address/domain/model/user_address_entity.dart';
import 'package:flower_app/app/feature/address_details/presentation/view_model/address_details_events.dart';
import 'package:flower_app/app/feature/address_details/presentation/view_model/address_details_states.dart';
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
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    if (userAddressEntity != null) {
      viewmodel.doIntent(getAddressFromCoordinatesEvent(
        latitude: double.parse(userAddressEntity!.lat!),
        longitude: double.parse(userAddressEntity!.long!)
      ));
    }
    
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocale(context).addressdetails,style: Theme.of(context).textTheme.headlineLarge,),
        leading: InkWell(child: Icon(Icons.arrow_back_ios_rounded),onTap: (){
          Navigator.of(context).pop();
        },),
      ),
      body: BlocProvider<AddressDetailsViewmodel>(create: (context) => viewmodel..doIntent(GetCitiesAndStatesEvent()),
      child: BlocConsumer<AddressDetailsViewmodel, AddressDetailsStates>(
        builder: (context, state) {
          if(state.firstBuildState!.isLoading == true){return Center(child: CircularProgressIndicator());
          }else if(state.firstBuildState!.isLoading == false && viewmodel.citiesList != null && viewmodel.areasList != null){

          return Padding(padding: EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: height*0.6,
                    width: width*0.9,
                    child: FlutterMap(
                     options: MapOptions(
                       initialCenter: LatLng(26.8206, 30.8025), // Center the map over London, UK
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
                         userAgentPackageName: "com.example.flower_app"
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
                  ),
                  Column(
                    children: [
                      SizedBox(height: height*0.03,),
              
                       TextFormField(
                        decoration: InputDecoration(
                          labelText: AppLocale(context).address,
                        ),
                        initialValue: userAddressEntity==null?null: viewmodel.address,
                        controller: TextEditingController(text: viewmodel.address),
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
              
                      SizedBox(height: height*0.03,),
              
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: AppLocale(context).phoneNumber,
                        ),
                        initialValue: userAddressEntity?.phone,
                        validator: userAddressEntity ==null? (value) =>  AppValidators.validateNumberPhone(value,context):null,
                        onChanged: (value) {
                          viewmodel.phone = value;
                          formKey.currentState?.validate();
                        },
                      ),
              
                      SizedBox(height: height*0.03,),
              
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: AppLocale(context).recipientName,
                        ),
                        initialValue: userAddressEntity?.userName ,
                        validator: userAddressEntity ==null? (value) {
                          if (value == null || value.isEmpty) {
                            return AppLocale(context).pleaseEnterTheRecipientname;
                          }
                          return null;
                        }:null,
                        onChanged: (value) {
                          viewmodel.recipientName = value;
                          formKey.currentState?.validate();
                        },
                      ),
              
                      SizedBox(height: height*0.03,),
                      Row(children: [
                        Expanded(
                          child: DropdownMenu(
                           dropdownMenuEntries: viewmodel.citiesList!.map((city) => DropdownMenuEntry(value: city, label: city.governorateNameEn!)).toList() ,
                           label: Text(AppLocale(context).city),
                           onSelected: (value) {
                             viewmodel.city = value!.governorateNameEn;
                             viewmodel.selectedCityId = value.id;
                             if(viewmodel.selectedAreaId != null && viewmodel.selectedAreaId != value.id) {
                              viewmodel.area = null;
                              viewmodel.selectedAreaId = null;
                             }
                             viewmodel.doIntent(GetFilteredStatesEvent(selectedCityId: viewmodel.selectedCityId));
                             
                           },)
                        ),
                      Expanded(
                          child: DropdownMenu(
                            
                            dropdownMenuEntries:viewmodel.filteredAreasList==null?viewmodel.areasList!.map((area) => DropdownMenuEntry(value: area, label: area.cityNameEn!)).toList(): 
                            viewmodel.filteredAreasList!.map((area) => DropdownMenuEntry(value: area, label: area.cityNameEn!)).toList(),
                           label: Text(AppLocale(context).area),
                           controller: TextEditingController(text:viewmodel.area),
                           onSelected: (value) {
                            viewmodel.area = value!.cityNameEn;
                            viewmodel.selectedAreaId = value.governorateId;
                           })
                        ),
                      ],),
                      SizedBox(height: height*0.04,),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              if(userAddressEntity == null){
                                print(viewmodel.address??"no address");
                                print(viewmodel.phone??"no phone");
                                print(viewmodel.area??"no area");
                                print(viewmodel.latitude??"no latitude");
                                print(viewmodel.longitude??"no longitude");
                                print(viewmodel.recipientName??"no recipient name");
                                viewmodel.doIntent(AddAddressEvent(
                                  street: viewmodel.address!,
                                  phone: viewmodel.phone!,
                                  city: viewmodel.area!,
                                  lat: viewmodel.latitude!.toString(),
                                  long: viewmodel.longitude!.toString(),
                                  username: viewmodel.recipientName!
                                ));
                               
                              }else{
                                viewmodel.doIntent(UpdateAddressEvent(
                                  addressId:  userAddressEntity!.addressId!,
                                  street: viewmodel.address!,
                                  phone: userAddressEntity!.phone ?? viewmodel.phone!,
                                  city: userAddressEntity!.city ?? viewmodel.area!,
                                  lat: userAddressEntity!.lat ?? viewmodel.latitude!.toString(),
                                  long: userAddressEntity!.long ?? viewmodel.longitude!.toString(),
                                  username: userAddressEntity!.userName ?? viewmodel.recipientName!
                                ));
                              }
                            }
                          },
                          child: Text(userAddressEntity==null?AppLocale(context).addAddress:AppLocale(context).updateAddress),
                        ),
                      ),
                      SizedBox(height: height*0.04,),
                    ],
                  )   
                ],
              ),
            ),
          ),
          );
          }else{
            return Center(child: Text(AppLocale(context).someThingWrong),);
          }
        },
        listener: (context, state) {
          
          if(state.addressDetailsState?.isLoading==true){
        ShowDialogUtils.showLoading(context);
      }else if (state.addressDetailsState?.isLoading==false && state.addressDetailsState?.error!=null){
        ShowDialogUtils.hideLoading(context);
        ShowDialogUtils.showMessage(context, title:AppLocale(context).someThingWrong,nigActionName: "ok",nigAction: (){Navigator.pop(context);});
      }else if (state.addressDetailsState?.isLoading==false && state.addressDetailsState?.success!=null){
        ShowDialogUtils.hideLoading(context);
        ShowDialogUtils.showMessage(
            context, title: state.addressDetailsState!.success!,
            nigActionName: "ok",
            nigAction: () {
              Navigator.pop(context);
            });
      }else if(state.addressDetailsState?.isLoading==false){
        ShowDialogUtils.hideLoading(context);
      } 
        },
        
       ),
      ),
    );
  }

}