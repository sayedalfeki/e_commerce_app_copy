import 'package:flower_app/app/core/resources/app_colors.dart';
import 'package:flower_app/app/core/reusable_widgets/loading_widget.dart';
import 'package:flower_app/app/core/utils/helper_function.dart';
import 'package:flower_app/app/feature/occasions/presentation/view/widget/all_occasions_item_widget.dart';
import 'package:flower_app/app/feature/occasions/presentation/view/widget/product_cart_item.dart';
import 'package:flower_app/app/feature/occasions/presentation/view_model/occasions_state.dart';
import 'package:flutter/material.dart';

import '../../../../../core/reusable_widgets/custom_error_widget.dart';
import '../../view_model/occasions_intent.dart';
import '../../view_model/occasions_view_model.dart';

class OccasionsBodyWidget extends StatelessWidget {
  const OccasionsBodyWidget({
    super.key,
    required this.state,
    required this.occasionsViewModel,
  });

  final OccasionsState state;
  final OccasionsViewModel occasionsViewModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          state.allOccasionsState.isLoading == true
              ? LoadingWidget()
              : state.allOccasionsState.success != null
              ? DefaultTabController(
                  initialIndex: state.allOccasionsState.index,
                  length:
                      state
                          .allOccasionsState
                          .success
                          ?.occasionsEntity
                          ?.length ??
                      0,
                  child: TabBar(
                    onTap: (value) {
                      occasionsViewModel.doIntent(
                        GetOccasionIntent(index: value),
                      );
                    },
                    padding: EdgeInsets.zero,
                    isScrollable: true,
                    tabAlignment: TabAlignment.start,
                    indicatorColor: AppColors.primaryColor,
                    dividerColor: Colors.transparent,
                    labelPadding: EdgeInsets.zero,
                    tabs: state.allOccasionsState.success!.occasionsEntity!
                        .map(
                          (e) => AllOccasionsItemWidget(
                            itemName: e.title ?? '',
                            isSelected:
                                state.allOccasionsState.index ==
                                state
                                    .allOccasionsState
                                    .success!
                                    .occasionsEntity!
                                    .indexOf(e),
                          ),
                        )
                        .toList(),
                  ),
                )
              : state.allOccasionsState.error != null
              ? CustomErrorWidget(
                  errorMessage: getException(
                    context,
                    state.allOccasionsState.error,
                  ),
                  onRetry: () {
                    occasionsViewModel.doIntent(AllOccasionsIntent());
                  },
                )
              : Container(),
          SizedBox(height: 8),
          state.productsOccasionState.isLoading == true
              ? LoadingWidget()
              : state.productsOccasionState.success != null
              ? state.productsOccasionState.success?.product != null &&
              state.productsOccasionState.success!.product!.isEmpty ?
          Container(
              height: MediaQuery
                  .sizeOf(context)
                  .height * .25,
              child: ProductCartItem(productOccasionEntity: null)) :
          Expanded(
            child:
            GridView.builder(
                    itemCount:
                        state.productsOccasionState.success!.product!.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 163 / 229,
                    ),
                    itemBuilder: (context, index) {
                      return ProductCartItem(
                        productOccasionEntity: state
                            .productsOccasionState
                            .success!
                            .product![index],
                      );
                    },
                  ),
                )
              : state.productsOccasionState.error != null
              ? CustomErrorWidget(
                  errorMessage: getException(
                    context,
                    state.productsOccasionState.error,
                  ),
                  onRetry: () {
                    occasionsViewModel.doIntent(
                        GetProductsOccasionIntent(occasionId:
                        state.allOccasionsState.success?.occasionsEntity?[
                        state.allOccasionsState.index
                        ].id ?? ''
                        )
                    );
                  },
                )
              : Container(),
        ],
      ),
    );
  }
}
