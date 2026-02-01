import 'package:flower_app/app/config/di/di.dart';
import 'package:flower_app/app/core/resources/app_colors.dart';
import 'package:flower_app/app/core/utils/app_locale.dart';
import 'package:flower_app/app/feature/product/presentation/view_model/product_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../view_model/product_intent.dart';
import '../../view_model/product_states.dart';
import '../../view_model/product_view_model.dart';

class ProductDetailsScreen extends StatefulWidget {
  final String? productId;

  ProductDetailsScreen({super.key, this.productId});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final ProductDetailsViewModel viewModel = getIt<ProductDetailsViewModel>();

  @override
  void initState() {
    super.initState();
    viewModel.doIntent(GetProductDetailsAction(widget.productId ?? ""));
    viewModel.cubitStream.listen((event) {
      switch (event) {
        case NavigateToProductDetailsEvent():
          return;
        case BackNavigationFromProductEvent():
          if (mounted) {
            Navigator.pop(context);
          }
        case AddToCartEvent():
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('${event.name} added to cart'),
              ),
            );
          }
      }
    },);
  }
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return BlocProvider<ProductDetailsViewModel>(
      create: (context) => viewModel,

      child:Scaffold(

          body:BlocBuilder<ProductDetailsViewModel,ProductDetailsStates>(
        builder: (context, state) {
          if(state.productDetailsState?.isLoading==true){
            return Center(child: CircularProgressIndicator(),);
          }else if (state.productDetailsState?.isLoading==false && state.productDetailsState?.success!=null)
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
                       children: state.productDetailsState!.success!.images!.map((e) {
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
                      Text("${AppLocale(context).egp} ${state.productDetailsState!.success!.price}",style: Theme.of(context).textTheme.headlineLarge,),
                      Spacer(),
                      Text("${AppLocale(context).status} :",style: Theme.of(context).textTheme.headlineLarge),
                      Text(state.productDetailsState!.success!.quantity! <= 0
                          ? AppLocale(context).out_of_stock
                          : AppLocale(context).in_stock,
                      style: Theme.of(context).textTheme.headlineMedium)
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(AppLocale(context).all_prices_include_tax),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(state.productDetailsState!.success!.title??"",style:Theme.of(context).textTheme.headlineMedium ,),
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
                  child: Text(state.productDetailsState!.success!.description??"",style:Theme.of(context).textTheme.headlineMedium ,),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(height: height*0.04,),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(AppLocale(context).bouquet_include, style: Theme
                      .of(context)
                      .textTheme
                      .headlineLarge,),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(height: height*0.01,),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(state.productDetailsState!.success!.description??"",style:Theme.of(context).textTheme.headlineMedium ,),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(onPressed: () {
                    viewModel.doIntent(AddToCartAction(
                        productId: state.productDetailsState!.success!.id
                        , name: state.productDetailsState!.success!.title));
                  }, child: Text(AppLocale(
                      context).add_to_cart, style: TextStyle(fontSize: 20),)),
                ),
              ),
              ],
            );
          }else if (state.productDetailsState?.isLoading==false && state.productDetailsState?.error!=null){

            return Center(child: Text(state.productDetailsState!.error!.toString()),);

          }else{

            return Container();

          }
        },
      )

      ) ,
   ) ;
  }
}