import 'package:ecommerceadmin/configs/assetspath.dart';
import 'package:ecommerceadmin/views/pages/widget/dashboarditemwidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
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
        SizedBox(height: 30),
        Row(
            children: statics
                .map(
                  (e) => Expanded(
                    child: DashBoardItemWidget(
                        label: e["label"]!,
                        value: e["value"]!,
                        icon: e["icon"]!),
                  ),
                )
                .toList())
      ],
    );
  }
}
