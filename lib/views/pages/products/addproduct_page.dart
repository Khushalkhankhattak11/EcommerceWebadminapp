import 'package:ecommerceadmin/views/pages/widget/productwidget/ProductAmount.dart';
import 'package:ecommerceadmin/views/pages/widget/productwidget/ProductMeta.dart';
import 'package:ecommerceadmin/views/pages/widget/productwidget/productdetails.dart';
import 'package:ecommerceadmin/widget/MyDropDownButton.dart';
import 'package:flutter/material.dart';

class AddProductPage extends StatelessWidget {
  const AddProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        title: Text("Add Products"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ProductDetail(),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ProductMeta(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            ProductAmount(),
          ],
        ),
      ),
    );
  }
}
