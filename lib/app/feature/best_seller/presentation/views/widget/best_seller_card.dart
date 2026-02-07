import 'package:flower_app/app/core/resources/app_colors.dart';
import 'package:flower_app/app/core/resources/font_manager.dart';
import 'package:flower_app/app/core/resources/values_manager.dart';
import 'package:flower_app/app/feature/best_seller/domain/models/best_seller_model.dart';
import 'package:flower_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class BestSellerCard extends StatelessWidget {
  final BestSellerModel bestSellerModel;
  final VoidCallback onTap;
  final VoidCallback onPressed;
  const BestSellerCard({super.key,required this.onTap,required this.bestSellerModel,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.sizeOf(context).width;
    var height=MediaQuery.sizeOf(context).height;
    return InkWell(
      onTap:onTap ,
      child: Container(
        width: double.infinity,
        height: 0.3*height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(0.02*width),
          border: Border.all(color: AppColors.lightGrayColor,width: AppSize.s1)
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.02*width,vertical: 0.01*height),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 0.16*height,width: double.infinity,child: Image.network(bestSellerModel.imgCover ?? '',height: 0.16*height,fit: BoxFit.cover,)),
              SizedBox(height: 0.01*height,),
              Expanded(
                child: Text(bestSellerModel.title ??'',style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: AppSize.s12,
                  fontWeight: FontWeights.regular
                ),),
              ),
              RichText(text: TextSpan(
                children: [
                  TextSpan(
                    text: "${AppLocalizations.of(context)!.egp} ${bestSellerModel.finalPriceAfterDiscount}  ",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: AppSize.s14)
                  ),
                  TextSpan(
                    text: bestSellerModel.price.toString(),
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: AppSize.s12,
                      fontWeight: FontWeights.regular,
                      decoration: TextDecoration.lineThrough,
                      decorationColor: AppColors.blackColor
                    )
                  ),
                  TextSpan(
                    text: "  ${bestSellerModel.discountPercentage}%",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: AppSize.s12,
                      fontWeight: FontWeights.regular,
                      color: AppColors.successColor
                    )
                  )
                ]
              )),
              ElevatedButton(
                onPressed: onPressed, 
                child: Row(
                  children: [
                    Icon(Icons.shopping_cart_outlined,color: AppColors.whiteColor,),
                    SizedBox(width: 0.03*width,),
                    Text(AppLocalizations.of(context)!.addToCart,style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontSize: FontSize.s13
                    ),)
                  ],
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}