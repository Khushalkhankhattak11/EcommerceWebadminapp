import 'package:ecommerceadmin/views/pages/widget/productwidget/ProductsTableData.dart';
import 'package:ecommerceadmin/widget/MyIconButton.dart';
import 'package:ecommerceadmin/widget/PrimaryButton.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceadmin/models/Product.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  late Future<List<Product>> _productsFuture;

  @override
  void initState() {
    super.initState();
    _productsFuture = fetchProducts();
  }

  Future<List<Product>> fetchProducts() async {
    try {
      final snapshot = await FirebaseFirestore.instance.collection('products').get();
      return snapshot.docs.map((doc) {
        final data = doc.data();
        return Product.fromJson(data);
      }).toList();
    } catch (e) {
      print("Error fetching products: $e");
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: 5,
              height: 30,
              color: Theme.of(context).colorScheme.primary,
            ),
            SizedBox(width: 10),
            Text(
              "Dashboard",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            MyIconButton(
              icon: Icons.refresh,
              color: Colors.orange,
              onTap: () {
                setState(() {
                  _productsFuture = fetchProducts();
                });
              },
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
              name: "Add New",
              icon: Icons.add,
              onTap: () {
                context.push('/addProduct');
              },
              color: Theme.of(context).colorScheme.primary,
            ),
            SizedBox(width: 10),
          ],
        ),
        SizedBox(height: 20),
        FutureBuilder<List<Product>>(
          future: _productsFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error fetching products'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text('No products available'));
            } else {
              return ProductsTableData(products: snapshot.data!);
            }
          },
        ),
      ],
    );
  }
}
