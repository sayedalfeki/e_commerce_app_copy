import 'package:flower_app/app/config/di/di.dart';
import 'package:flower_app/app/core/resources/app_colors.dart';
import 'package:flower_app/app/core/routes/app_route.dart';
import 'package:flower_app/app/core/utils/helper_function.dart';
import 'package:flower_app/app/feature/product_details/presentation/view_model/product_details_args.dart';
import 'package:flower_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../view_model/search_events.dart';
import '../../view_model/search_states.dart';
import '../../view_model/search_view_model.dart';
import '../widgets/search_product_grid_widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final SearchViewModel viewModel = getIt<SearchViewModel>();
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _searchFocusNode.requestFocus();
    });

    _searchController.addListener(() {
      viewModel.doIntent(SearchProductsEvent(_searchController.text));
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;

    return Scaffold(
      backgroundColor: AppColors.baseWhiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.baseWhiteColor,
        elevation: 0,
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        title: BlocBuilder<SearchViewModel, SearchStates>(
          bloc: viewModel,
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: width - 32,
                  minHeight: 56,
                ),
                child: TextField(
                  controller: _searchController,
                  focusNode: _searchFocusNode,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 16,
                    ),
                    hintText: AppLocalizations.of(context)!.search,
                    hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.unSelectedSectionGreyColor,
                    ),
                    filled: true,
                    fillColor: AppColors.baseWhiteColor,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        color: AppColors.lightGrayColor,
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        color: AppColors.primaryColor,
                        width: 1,
                      ),
                    ),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: AppColors.unSelectedSectionGreyColor,
                    ),
                    suffixIcon: state.currentKeyword.isNotEmpty
                        ? IconButton(
                            icon: const Icon(
                              Icons.close,
                              size: 20,
                              color: AppColors.unSelectedSectionGreyColor,
                            ),
                            onPressed: () {
                              _searchController.clear();
                              viewModel.doIntent(ClearSearchEvent());
                            },
                          )
                        : null,
                  ),
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.unSelectedSectionGreyColor,
                  ),
                  textInputAction: TextInputAction.search,
                ),
              ),
            );
          },
        ),
        titleSpacing: 0,
      ),
      body: BlocBuilder<SearchViewModel, SearchStates>(
        bloc: viewModel,
        builder: (context, state) {
          final searchState = state.searchState;

          if (searchState == null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.search, size: 80, color: AppColors.lightGrayColor),
                  SizedBox(height: 0.02 * height),
                  Text(
                    'Search For Any Product You Want',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppColors.primaryColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          }

          if (searchState.isLoading == true) {
            return Center(
              child: CircularProgressIndicator(color: AppColors.primaryColor),
            );
          }

          if (searchState.error != null) {
            return Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 0.04 * width),
                child: Text(
                  getException(context, searchState.error!),
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }

          if (searchState.success != null && searchState.success!.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.search_off,
                    size: 80,
                    color: AppColors.lightGrayColor,
                  ),
                  SizedBox(height: 0.02 * height),
                  Text(
                    'No products found',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppColors.lightGrayColor,
                    ),
                  ),
                  SizedBox(height: 0.01 * height),
                  Text(
                    'Try searching with different keywords',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppColors.lightGrayColor,
                    ),
                  ),
                ],
              ),
            );
          }

          if (searchState.success != null && searchState.success!.isNotEmpty) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 0.04 * width),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 0.02 * height),
                  Text(
                    '${searchState.success!.length} products found',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  SizedBox(height: 0.02 * height),
                  Expanded(
                    child: SearchProductGridWidget(
                      products: searchState.success!,
                      onProductTap: (product) {
                        Navigator.pushNamed(
                          context,
                          Routes.productDetails,
                          arguments: ProductDetailsArgs(productId: product.id),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
