import 'package:ecommerceadmin/views/pages/Product/ProductPage.dart';
import 'package:ecommerceadmin/views/pages/category/CategoryPage.dart';
import 'package:ecommerceadmin/views/pages/coupon/coupon_page.dart';
import 'package:ecommerceadmin/views/pages/dashboard/dashboard.dart';
import 'package:ecommerceadmin/views/pages/setting/setting_page.dart';
import 'package:flutter/material.dart';

class DrawerProvider extends ChangeNotifier{
   int selectedPageIndex = 0;
   var pages = [
      DashboardPage(),
      ProductPage(),
      CategoryPage(),
      CouponPage(),
      SettingPage(),
   ];
   void seletedMenu(int index) {
      selectedPageIndex = index;
      notifyListeners();
   }
}
