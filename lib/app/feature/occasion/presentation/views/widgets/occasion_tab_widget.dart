import 'package:flower_app/app/config/base_response/base_response.dart';
import 'package:flower_app/app/config/di/di.dart';
import 'package:flower_app/app/core/resources/app_colors.dart';
import 'package:flower_app/app/core/resources/font_manager.dart';
import 'package:flower_app/app/core/resources/values_manager.dart';
import 'package:flower_app/app/feature/occasion/data/models/product_model.dart';
import 'package:flower_app/app/feature/occasion/domain/use_cases/get_products_by_occasion_use_case.dart';
import 'package:flower_app/app/feature/occasion/presentation/views/widgets/product_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OccasionTabWidget extends StatefulWidget {
  final String occasionId;

  const OccasionTabWidget({super.key, required this.occasionId});

  @override
  State<OccasionTabWidget> createState() => _OccasionTabWidgetState();
}

class _OccasionTabWidgetState extends State<OccasionTabWidget> {
  final _getProductsUseCase = getIt<GetProductsByOccasionUseCase>();
  List<ProductModel> _products = [];
  bool _isLoading = false;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _fetchProducts();
  }

  @override
  void didUpdateWidget(OccasionTabWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.occasionId != widget.occasionId) {
      _fetchProducts();
    }
  }

  Future<void> _fetchProducts() async {
    if (widget.occasionId.isEmpty) return;

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    final response = await _getProductsUseCase(widget.occasionId);

    if (mounted) {
      setState(() {
        switch (response) {
          case SuccessResponse<List<ProductModel>>():
            _products = response.data;
            _errorMessage = null;
            break;
          case ErrorResponse<List<ProductModel>>():
            _errorMessage = response.error.toString();
            break;
        }
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(
        child: CircularProgressIndicator(color: AppColors.primaryColor),
      );
    }

    if (_errorMessage != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _errorMessage!,
              style: TextStyle(
                fontFamily: FontsFamily.inter,
                fontSize: FontSize.s14,
                color: AppColors.errorColor,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: AppSize.s16.h),
            ElevatedButton(
              onPressed: _fetchProducts,
              child: const Text('Retry'),
            ),
          ],
        ),
      );
    }

    if (_products.isEmpty) {
      return Center(
        child: Text(
          'No products found for this occasion',
          style: TextStyle(
            fontFamily: FontsFamily.inter,
            fontSize: FontSize.s14,
            color: AppColors.grayColor,
          ),
        ),
      );
    }

    return GridView.builder(
      padding: EdgeInsets.symmetric(
        horizontal: AppPadding.p16.w,
        vertical: AppPadding.p8.h,
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: AppSize.s12.w,
        mainAxisSpacing: AppSize.s16.h,
        childAspectRatio: 0.72,
      ),
      itemCount: _products.length,
      itemBuilder: (context, index) {
        final product = _products[index];
        return ProductCardWidget(
          name: product.title,
          price: product.priceAfterDiscount.toInt(),
          oldPrice: product.price.toInt(),
          discount: product.discountPercentage,
          imageUrl: product.imgCover,
        );
      },
    );
  }
}
