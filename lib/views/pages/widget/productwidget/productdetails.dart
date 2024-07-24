import 'package:ecommerceadmin/widget/MyDropDownButton.dart';
import 'package:flutter/material.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var category = [
      "Electronic",
      "Clothing",
      "Mobile",
    ];
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.dashboard),
              SizedBox(width: 10),
              Text('Product Details'),
            ],
          ),
          SizedBox(height: 10),
          Divider(
            color: Theme.of(context).colorScheme.onBackground.withOpacity(0.1),
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Text(
                'Product name',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
          SizedBox(height: 10),
          TextFormField(
            // controller: addProductProvider.name,
            decoration: InputDecoration(
              hintText: 'Product name',
            ),
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Text(
                'Description',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
          SizedBox(height: 10),
          TextFormField(
            maxLines: 5,
            // controller: addProductProvider.description,
            decoration: InputDecoration(
              hintText: 'Description',
            ),
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Text(
                'Category',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
          SizedBox(height: 10),
          SearchDropDownButton(
            items: category,
            selectedValue: (val) {},
            hintText: "Select Category",
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Text(
                'Sub-Category',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
          SizedBox(height: 10),
          SearchDropDownButton(
            items: category,
            selectedValue: (val) {},
            hintText: "Select SubCategory",
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Text(
                'Sub-Category',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Text("Active"),
              SizedBox(width: 10),
              Transform.scale(
                scale: 0.5,
                child: Switch(
                  value: true,
                  onChanged: (value) {},
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
