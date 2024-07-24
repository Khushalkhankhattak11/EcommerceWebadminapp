
import 'package:ecommerceadmin/views/pages/dashboard/dashboard.dart';
import 'package:ecommerceadmin/provider/drawer/drawer_provider.dart';
import 'package:ecommerceadmin/widget/appbarwidget/appbar_widget.dart';
import 'package:ecommerceadmin/widget/drawer/mydrawer.dart';
import 'package:ecommerceadmin/widget/responsivelayout.dart';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final draweProvider = Provider.of<DrawerProvider>(context, listen: false);
    final isDestop =Responsivelayout.isDesktop(context);
    return Scaffold(
      drawer: isDestop ?null :MyDrawer(),
      body: SafeArea(
        child: Row(
          children: [
            if(isDestop)
              Expanded(
                child: MyDrawer(),
              ),
            Expanded(
              flex: 6,
              child: Column(
                children: [
                  MyAppBarWidget(),
                  SizedBox(height: 20),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child:Consumer<DrawerProvider>(builder: (context,value,child)=>value.pages[value.selectedPageIndex]),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
