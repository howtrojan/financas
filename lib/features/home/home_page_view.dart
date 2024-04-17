import 'package:financas/common/constants/app_colors.dart';
import 'package:financas/common/constants/keys.dart';
import 'package:financas/common/extensions/page_controller_ext.dart';
import 'package:financas/features/home/home_page.dart';
import 'package:financas/features/profile/profile_page.dart';
import 'package:financas/features/stats/stats_page.dart';
import 'package:financas/features/wallet/wallet_page.dart';
import 'package:financas/widgets/custom_bottom_app_bar.dart';
import 'package:flutter/material.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  final pageController = PageController();

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      // ignore: avoid_print
      print(pageController.page.toString());
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: const [
          HomePage(),
          StatsPage(),
          WalletPage(),
          ProfilePage(),
        ],
      ),
      floatingActionButton: ClipOval(
        child: FloatingActionButton(
          backgroundColor: AppColors.primary,
          onPressed: () {},
          child: const Icon(
            Icons.add,
            color: AppColors.white,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: CustomBottomAppBar(
        controller: pageController,
        selectedItemColor: AppColors.primary,
        children: [
          CustomBottomAppBarItem(
              key: Keys.homePageBottomAppBarItem,
              label: BottomAppBarItem.home.name,
              primaryIcon: Icons.home,
              secondaryIcon: Icons.home_outlined,
              onPressed: () {
                pageController.jumpToPage(0);
              }),
          CustomBottomAppBarItem(
              key: Keys.statsPageBottomAppBarItem,
              label: BottomAppBarItem.stats.name,
              primaryIcon: Icons.analytics,
              secondaryIcon: Icons.analytics_outlined,
              onPressed: () {
                pageController.jumpToPage(1);
              }),
          CustomBottomAppBarItem.empty(),
          CustomBottomAppBarItem(
              key: Keys.walletPageBottomAppBarItem,
              label: BottomAppBarItem.wallet.name,
              primaryIcon: Icons.account_balance_wallet,
              secondaryIcon: Icons.account_balance_wallet_outlined,
              onPressed: () {
                pageController.jumpToPage(2);
              }),
          CustomBottomAppBarItem(
              key: Keys.profilePageBottomAppBarItem,
              label: BottomAppBarItem.profile.name,
              primaryIcon: Icons.person,
              secondaryIcon: Icons.person_outline,
              onPressed: () {
                pageController.jumpToPage(3);
              }),
        ],
      ),
    );
  }
}
