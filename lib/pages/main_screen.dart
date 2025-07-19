import 'package:flutter/material.dart';
import 'package:login_app_test/pages/add_screen.dart';
import 'package:login_app_test/pages/my_account_screen.dart';
import 'package:login_app_test/pages/search_screen.dart';
import 'package:login_app_test/widgets/custom_buttom_navbar.dart';

import '../core/theme/app_color.dart';
import 'home_page.dart';


class MainScreen extends StatelessWidget {
  const MainScreen({super.key});
  static final String routeName = 'mainScreen';
  @override
  Widget build(BuildContext context) {
    return CustomBottomNavBar(
      icons: [
     Icons.home,
     Icons.search,
     Icons.add,
     Icons.account_circle_outlined,
      ],
      labels: ['الرئيسية', 'البحث', 'إضافة', 'حسابي'],
      pages: [
        HomePage(),
        SearchScreen(),
        AddScreen(),
        MyAccountScreen(),
      ],
      selectedColor:Colors.red,
      unselectedColor: AppColors.grey,
    );
  }
}