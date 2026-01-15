import 'package:flower_app/app/config/di/di.dart';
import 'package:flower_app/app/core/resources/app_colors.dart';
import 'package:flower_app/app/core/utils/app_locale.dart';
import 'package:flower_app/app/feature/product_details/presentation/view_model/product_details_events.dart';
import 'package:flower_app/app/feature/product_details/presentation/view_model/product_details_states.dart';
import 'package:flower_app/app/feature/product_details/presentation/view_model/product_details_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailsScreen extends StatelessWidget{
  String? productId;
  ProductDetailsScreen({this.productId});
  ProductDetailsViewModel viewModel = getIt<ProductDetailsViewModel>();
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    viewModel.doIntent(GetProductDetailsEvent(productId??"673e1cd711599201718280fb"));
    return BlocProvider<ProductDetailsViewModel>(
      create: (context) => viewModel,
      
      child:Scaffold(
      
      body:BlocBuilder<ProductDetailsViewModel,ProductDetailsStates>(
        builder: (context, state) {
          if(state.productDetailsState?.isLoading==true){
            return Center(child: CircularProgressIndicator(),);
          }else if (state.productDetailsState?.isLoading==false && state.productDetailsState?.data!=null)
          {

           return CustomScrollView(
              slivers: [
              SliverAppBar(
                pinned: true,
                
                leading: Icon(Icons.arrow_back_ios_rounded),
                expandedHeight: height*0.50,
                flexibleSpace: FlexibleSpaceBar(
                  
                  collapseMode: CollapseMode.parallax,
                  background: Container(
                    color: AppColors.secondaryColor,
                    child: SizedBox(
                      height: height*0.50,
                      child: CarouselView(itemExtent: width,
                       
                       itemSnapping: true,
                       children: state.productDetailsState!.data!.images!.map((e) {
                         return Image.network(e!,
                         fit: BoxFit.fill,

                         );
                       },).toList(),
                      
                       ),
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(height: height*0.02,),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Text("${AppLocale(context).egp} ${state.productDetailsState!.data!.price}",style: Theme.of(context).textTheme.headlineLarge,),
                      Spacer(),
                      Text("${AppLocale(context).status} :",style: Theme.of(context).textTheme.headlineLarge),
                      Text(state.productDetailsState!.data!.quantity! <=0?AppLocale(context).outofstock:AppLocale(context).instock,
                      style: Theme.of(context).textTheme.headlineMedium)
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(AppLocale(context).allpricesincludetax),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(state.productDetailsState!.data!.title??"",style:Theme.of(context).textTheme.headlineMedium ,),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(height: height*0.04,),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(AppLocale(context).description,style:Theme.of(context).textTheme.headlineLarge ,),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(height: height*0.01,),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(state.productDetailsState!.data!.description??"",style:Theme.of(context).textTheme.headlineMedium ,),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(height: height*0.04,),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(AppLocale(context).bouquetinclude,style:Theme.of(context).textTheme.headlineLarge ,),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(height: height*0.01,),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(state.productDetailsState!.data!.description??"",style:Theme.of(context).textTheme.headlineMedium ,),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(onPressed: (){}, child: Text(AppLocale(context).addtocart,style: TextStyle(fontSize: 20),)),
                ),
              ),
              ],
            );
         
          }else if (state.productDetailsState?.isLoading==false && state.productDetailsState?.errorMessage!=null){

            return Center(child: Text(state.productDetailsState!.errorMessage!),);

          }else{

            return Container();

          }
        },
      )
       
    ) ,
   ) ;
      
  }

}