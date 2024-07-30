import 'package:ecommerceadmin/configs/assetspath.dart';
import 'package:ecommerceadmin/views/pages/widget/dashboardwidget/dashboarditemwidget.dart';
import 'package:ecommerceadmin/views/pages/widget/dashboardwidget/orderhistroywidget.dart';
import 'package:ecommerceadmin/widget/MyIconButton.dart';
import 'package:ecommerceadmin/widget/PrimaryButton.dart';
import 'package:ecommerceadmin/widget/responsivelayout.dart';
import 'package:flutter/material.dart';


class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDestop =Responsivelayout.isDesktop(context);
    var statics = [
      {"icon": IconsAssets.cart, "label": "Total Order", "value": "234"},
      {"icon": IconsAssets.refresh, "label": "Pending Order", "value": "24"},
      {"icon": IconsAssets.car, "label": "Processing Order", "value": "124"},
      {"icon": IconsAssets.done, "label": "Completed Order", "value": "14"},
    ];
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: 7,
              height: 40,
              color: Theme.of(context).colorScheme.primary,
            ),
            SizedBox(width: 10),
            Text("DashBoard", style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            MyIconButton(
              icon: Icons.refresh,
              color: Colors.orange,
              onTap: () {},
            ),
            SizedBox(width: 10),
            PrimaryButton(
              name: "Export",
              icon: Icons.import_export_sharp,
              onTap: () {},
              color: Colors.deepPurple,
            ),
            SizedBox(width: 10),
            PrimaryButton(
              name: "Import",
              icon: Icons.download_rounded,
              onTap: () {},
              color: Theme.of(context).colorScheme.primary,
            ),
            SizedBox(width: 10),
          ],
        ),
        SizedBox(height: 20),

        Row(
          children: statics
              .map(
                (e) => Expanded(
                  child: DashBoardItemWidget(
                      label: e["label"]!, value: e["value"]!, icon: e["icon"]!),
                ),
              )
              .toList(),
        ),
        SizedBox(height: 20),
        OrderhistoryWidget(),
      ],
    );
  }
}
