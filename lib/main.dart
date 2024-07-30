import 'package:ecommerceadmin/configs/pagerouter.dart';
import 'package:ecommerceadmin/configs/theme.dart';
import 'package:ecommerceadmin/provider/AuthProvider.dart';
import 'package:ecommerceadmin/provider/ThemeProvider.dart';
import 'package:ecommerceadmin/provider/category/CategoryProvider.dart';
import 'package:ecommerceadmin/provider/drawer/drawer_provider.dart';
import 'package:ecommerceadmin/provider/products/AddProductProvider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toastification/toastification.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => DrawerProvider()),
        ChangeNotifierProvider(
            create: (_) => AddProductProvider()..fetchProducts()),
        ChangeNotifierProvider(create: (_) => CategoryProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (context,value,_)=> MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Deshi Mart',
      theme: lightTheme,
      builder: (context, child) {
        return ToastificationConfigProvider(
          config: const ToastificationConfig(
            alignment: Alignment.center,
            itemWidth: 440,
            animationDuration: Duration(milliseconds: 500),
          ),
          child: child!,
        );
      },
      themeMode: value.ThemeModes,
      darkTheme: darkTheme,
      routerConfig: router,
    ));
  }
}
