import 'package:ecommerceadmin/widget/responsivelayout.dart';
import 'package:flutter/material.dart';

class MyAppBarWidget extends StatelessWidget {
  const MyAppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDestop = Responsivelayout.isDesktop(context);
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      child: Row(
        children: [
          SizedBox(width: 10),
          if (!isDestop)
            IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(Icons.menu),
            ),
          if (isDestop) Spacer(),
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "Search here....",
                suffixIcon: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  child: Icon(Icons.search),
                ),
                fillColor: Theme.of(context).colorScheme.background,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          SizedBox(width: 20),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.dark_mode),
          ),
          SizedBox(width: 20),
          Container(
            padding: EdgeInsets.all(7),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  child: Text(
                    "K",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onBackground),
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  "Khushal Khan",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onPrimaryContainer),
                ),
              ],
            ),
          ),
          SizedBox(width: 20),
        ],
      ),
    );
  }
}
