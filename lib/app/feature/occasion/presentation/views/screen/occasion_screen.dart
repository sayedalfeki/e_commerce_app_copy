import 'package:flower_app/app/config/di/di.dart';
import 'package:flower_app/app/core/resources/app_colors.dart';
import 'package:flower_app/app/core/resources/font_manager.dart';
import 'package:flower_app/app/core/resources/values_manager.dart';
import 'package:flower_app/app/core/utils/app_locale.dart';
import 'package:flower_app/app/feature/occasion/presentation/view_model/occasion_view_model.dart';
import 'package:flower_app/app/feature/occasion/presentation/views/widgets/occasion_tab_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class OccasionScreen extends StatefulWidget {
  const OccasionScreen({super.key});

  @override
  State<OccasionScreen> createState() => _OccasionScreenState();
}

class _OccasionScreenState extends State<OccasionScreen> {
  final viewModel = getIt<OccasionViewModel>();

  @override
  void initState() {
    super.initState();
    viewModel.getAllOccasions();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: viewModel,
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: AppBar(
          backgroundColor: AppColors.whiteColor,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: AppColors.blackColor),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(
            AppLocale(context).occasion,
            style: TextStyle(
              fontFamily: FontsFamily.inter,
              fontSize: FontSize.s20,
              fontWeight: FontWeights.medium,
              color: AppColors.blackColor,
            ),
          ),
        ),
        body: Consumer<OccasionViewModel>(
          builder: (context, viewModel, child) {
            if (viewModel.isLoading) {
              return const Center(
                child: CircularProgressIndicator(color: AppColors.primaryColor),
              );
            }

            if (viewModel.errorMessage != null) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      viewModel.errorMessage!,
                      style: TextStyle(
                        fontFamily: FontsFamily.inter,
                        fontSize: FontSize.s16,
                        color: AppColors.errorColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: AppSize.s20.h),
                    ElevatedButton(
                      onPressed: () => viewModel.getAllOccasions(),
                      child: Text(
                        AppLocale(context).retry,
                        style: TextStyle(
                          fontFamily: FontsFamily.inter,
                          fontSize: FontSize.s16,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }

            if (viewModel.occasions.isEmpty) {
              return Center(
                child: Text(
                  'No occasions found',
                  style: TextStyle(
                    fontFamily: FontsFamily.inter,
                    fontSize: FontSize.s16,
                    color: AppColors.grayColor,
                  ),
                ),
              );
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppPadding.p16.w,
                    vertical: AppPadding.p8.h,
                  ),
                  child: Text(
                    AppLocale(context).occasionSubtitle,
                    style: TextStyle(
                      fontFamily: FontsFamily.inter,
                      fontSize: FontSize.s13,
                      fontWeight: FontWeights.medium,
                      color: AppColors.grayColor,
                    ),
                  ),
                ),
                SizedBox(
                  height: 50.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.symmetric(horizontal: AppPadding.p16.w),
                    itemCount: viewModel.occasions.length,
                    itemBuilder: (context, index) {
                      final occasion = viewModel.occasions[index];
                      final isSelected = viewModel.selectedTabIndex == index;

                      return GestureDetector(
                        onTap: () => viewModel.selectTab(index),
                        child: Container(
                          margin: EdgeInsets.only(right: AppMargin.m12.w),
                          padding: EdgeInsets.symmetric(
                            horizontal: AppPadding.p20.w,
                            vertical: AppPadding.p8.h,
                          ),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: isSelected
                                    ? AppColors.primaryColor
                                    : Colors.transparent,
                                width: 2.w,
                              ),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              occasion.name,
                              style: TextStyle(
                                fontFamily: FontsFamily.inter,
                                fontSize: FontSize.s16,
                                fontWeight: FontWeights.regular,
                                color: isSelected
                                    ? AppColors.primaryColor
                                    : AppColors.grayColor,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: AppSize.s16.h),
                Expanded(
                  child: OccasionTabWidget(
                    occasionId: viewModel.selectedOccasion?.id ?? '',
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
