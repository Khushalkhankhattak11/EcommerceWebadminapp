import 'package:flutter/material.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: 7,height: 40,color: Theme.of(context).colorScheme.primary,

            ),
            SizedBox(width: 10),
            Text("Category",style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        SizedBox(height: 30),
      ],
    );
  }
}
