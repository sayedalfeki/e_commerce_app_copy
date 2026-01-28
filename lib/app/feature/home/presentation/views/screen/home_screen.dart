import 'package:flower_app/app/config/di/di.dart';
import 'package:flower_app/app/core/resources/app_colors.dart';
import 'package:flower_app/app/feature/home/presentation/view_model/app_tab.dart';
import 'package:flower_app/app/feature/home/presentation/view_model/home_states.dart';
import 'package:flower_app/app/feature/home/presentation/view_model/home_view_model.dart';
import 'package:flower_app/app/feature/home/presentation/views/tabs/cart_tab/presentation/views/screen/cart_tab.dart';
import 'package:flower_app/app/feature/home/presentation/views/tabs/categories_tab/presentation/views/screen/categories_tab.dart';
import 'package:flower_app/app/feature/home/presentation/views/tabs/home_tab/presentation/views/screen/home_tab.dart';
import 'package:flower_app/app/feature/profile/presentation/profile/view/widget/profile_navigator_widget.dart';
import 'package:flower_app/l10n/app_localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../view_model/home_intent.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeViewModel viewModel=getIt<HomeViewModel>();


  @override
  void initState() {
    super.initState();
    viewModel.doIntent(GetTokenAction());
  }
  @override
  Widget build(BuildContext context) {

    return BlocProvider<HomeViewModel>.value(
      value: viewModel,
      child: BlocBuilder<HomeViewModel,HomeStates>(
        builder: (context, state) {
          List<Widget> tabs = buildTabs(viewModel.state);
          List<BottomNavigationBarItem>bottomNavBarItems = buildNavItems(
              context, viewModel.state);


          return Scaffold(
            body: IndexedStack(
              index: state.homeBaseState.currAppTab.index,
              children: tabs,
            ),
            bottomNavigationBar: Container(
              decoration: BoxDecoration(
                border: Border(top: BorderSide(color: AppColors.borderBottomNavBarColor,width: 1))
              ),
              child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                backgroundColor: AppColors.secondaryColor,
                currentIndex: state.homeBaseState.currAppTab.index,
                onTap: (index) {
                  final tab=AppTab.values[index];
                  context.read<HomeViewModel>().doIntent(
                      ChangeCurrentTabAction(tab));

                },
                items: bottomNavBarItems,

              ),
            ),
          );
        },
      ),
    );
  }

  List<Widget> buildTabs(HomeStates state) {
    final baseTabs = [
      const HomeTab(),
      const CategoriesTab(),
      const CartTab(),
    ];

    if (state.homeBaseState.success != null &&
        state.homeBaseState.success!.isNotEmpty) {
      baseTabs.add(const ProfileNavigatorWidget());
    }

    return baseTabs;
  }

  List<BottomNavigationBarItem> buildNavItems(BuildContext context,
      HomeStates state) {
    final items = [
      const BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
      const BottomNavigationBarItem(
          icon: Icon(Icons.category), label: "Categories"),
      const BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart), label: "Cart"),
    ];

    if (state.homeBaseState.success != null &&
        state.homeBaseState.success!.isNotEmpty) {
      items.add(
        BottomNavigationBarItem(
          icon: const Icon(CupertinoIcons.person),
          label: AppLocalizations.of(context)!.profile,
        ),
      );
    }

    return items;
  }

}
