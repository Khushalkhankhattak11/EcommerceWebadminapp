import 'package:ecommerceadmin/views/Auth/Auth.dart';
import 'package:ecommerceadmin/views/Splace/SplaceScreen.dart';
import 'package:ecommerceadmin/views/home/home_page.dart';
import 'package:ecommerceadmin/views/pages/Product/AddProduct.dart';
import 'package:ecommerceadmin/views/pages/Product/ProductPage.dart';
import 'package:ecommerceadmin/views/pages/category/AddCategory.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/auth',
      builder: (BuildContext context, GoRouterState state) {
        return const AuthPage();
      },
    ),
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const SplaceScreen();
      },
    ),
    GoRoute(
      path: '/home',
      builder: (BuildContext context, GoRouterState state) {
        return const HomePage();
      },
    ),
    GoRoute(
      path: '/addProduct',
      builder: (BuildContext context, GoRouterState state) {
        return const AddProduct();
      },
    ),
    GoRoute(
      path: '/addCategory',
      builder: (BuildContext context, GoRouterState state) {
        return const AddCategory();
      },
    ),
  ],
);
