import 'package:flower_app/app/config/di/di.dart';
import 'package:flower_app/app/core/resources/app_colors.dart';
import 'package:flower_app/app/core/reusable_widgets/show_dialog_utils.dart';
import 'package:flower_app/app/core/utils/app_locale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../view_model/product_intent.dart';
import '../view_model/product_states.dart';
import '../view_model/product_view_model.dart';

class ProductDetailsScreen extends StatefulWidget {
  final String? productId;

  const ProductDetailsScreen({super.key, this.productId});

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
        case BackNavigationFromProductEvent():
          if (mounted) Navigator.pop(context);
          break;

        case AddToCartEvent():
          if (mounted) {
            ShowDialogUtils.showMessage(
              context,
              title: AppLocale(context).success,
              content: '${event.name} added to cart',
              posActionName: AppLocale(context).ok,
            );
          }
          break;

        default:
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return BlocProvider<ProductDetailsViewModel>.value(
      value: viewModel,
      child: Scaffold(
        body: BlocConsumer<ProductDetailsViewModel, ProductDetailsStates>(
          listener: (context, state) {
            if (state.addToCartState?.isLoading == true) {
              ShowDialogUtils.showLoading(context);
            } else if (state.addToCartState?.isLoading == false) {
              ShowDialogUtils.hideLoading(context);

              if (state.addToCartState?.error != null) {
                ShowDialogUtils.showMessage(
                  context,
                  title: AppLocale(context).serverError,
                  content: state.addToCartState!.error.toString(),
                  posActionName: AppLocale(context).ok,
                );
              }
            }
          },
          builder: (context, state) {
            if (state.productDetailsState?.isLoading == true) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state.productDetailsState?.success != null) {
              final product = state.productDetailsState!.success!;

              return CustomScrollView(
                slivers: [
                  SliverAppBar(
                    pinned: true,
                    leading: InkWell(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(Icons.arrow_back_ios_rounded),
                    ),
                    expandedHeight: height * 0.5,
                    flexibleSpace: FlexibleSpaceBar(
                      collapseMode: CollapseMode.parallax,
                      background: Container(
                        color: AppColors.secondaryColor,
                        child: CarouselView(
                          itemExtent: width,
                          itemSnapping: true,
                          children: product.images!
                              .map((e) => Image.network(e!, fit: BoxFit.fill))
                              .toList(),
                        ),
                      ),
                    ),
                  ),

                  /// Price & Status
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          Text(
                            "${AppLocale(context).egp} ${product.price}",
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                          const Spacer(),
                          Text("${AppLocale(context).status}: "),
                          Text(
                            product.quantity! <= 0
                                ? AppLocale(context).out_of_stock
                                : AppLocale(context).in_stock,
                          ),
                        ],
                      ),
                    ),
                  ),

                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child:
                      Text(AppLocale(context).all_prices_include_tax),
                    ),
                  ),

                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(product.title ?? ""),
                    ),
                  ),

                  /// Description
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(AppLocale(context).description),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(product.description ?? ""),
                    ),
                  ),

                  /// Bouquet
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(AppLocale(context).bouquet_include),
                    ),
                  ),

                  /// Add to cart
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: ElevatedButton(
                        onPressed: () {
                          viewModel.doIntent(
                            AddToCartAction(
                              productId: product.id,
                              name: product.title,
                            ),
                          );
                        },
                        child: Text(AppLocale(context).add_to_cart),
                      ),
                    ),
                  ),
                ],
              );
            }

            if (state.productDetailsState?.error != null) {
              return Center(
                child: Text(state.productDetailsState!.error.toString()),
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}
