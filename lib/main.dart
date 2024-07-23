import 'package:ecommerceadmin/configs/theme.dart';
import 'package:ecommerceadmin/views/home/home_page.dart';
import 'package:ecommerceadmin/provider/drawer/drawer_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>DrawerProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: lightTheme,
        themeMode: ThemeMode.dark,
        darkTheme: darkTheme,

        home: HomePage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
