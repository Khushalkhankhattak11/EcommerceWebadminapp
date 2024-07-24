import 'package:dotted_border/dotted_border.dart';
import 'package:ecommerceadmin/provider/category/category_provider.dart';
import 'package:ecommerceadmin/widget/MyIconButton.dart';
import 'package:ecommerceadmin/widget/PrimaryButton.dart';
import 'package:ecommerceadmin/widget/responsivelayout.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class AddCategory extends StatelessWidget {
  const AddCategory({super.key});

  @override
  Widget build(BuildContext context) {
    final isDestop = Responsivelayout.isDesktop(context);
    final categoryProvider = Provider.of<CategoryProvider>(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [],
            ),
            Container(
              width: isDestop
                  ? MediaQuery.of(context).size.width / 2
                  : MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  const Row(
                    children: [
                      Icon(Icons.dashboard),
                      SizedBox(width: 10),
                      Text('Category Details'),
                    ],
                  ),
                  SizedBox(height: 10),
                  Divider(
                    color: Theme.of(context)
                        .colorScheme
                        .onBackground
                        .withOpacity(0.1),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Text(
                        'Category Name',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: categoryProvider.categoryName,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      hintText: "Enter Category Title",
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Text(
                        'Sub Category List *',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: categoryProvider.subCategory,
                          textInputAction: TextInputAction.done,
                          onSubmitted: (value) {
                            //categoryProvider.addSubCategory(value);
                          },
                          decoration: InputDecoration(
                            hintText: "Enter Sub Category *",
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      MyIconButton(
                        icon: Icons.done,
                        color: Colors.green,
                        onTap: () {
                          // categoryProvider.addSubCategory(
                          // categoryProvider.subCategory.text);
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  // Consumer<CategoryProvider>(builder: (context, value, child) {
                  //   return value.subCategories.isEmpty
                  //       ? DottedBorder(
                  //       radius: Radius.circular(20),
                  //       color: Theme.of(context)
                  //           .colorScheme
                  //           .onBackground
                  //           .withOpacity(0.1),
                  //       strokeWidth: 1,
                  //       dashPattern: [5, 7],
                  //       child: Container(
                  //         padding: EdgeInsets.all(5),
                  //         height: 100,
                  //         child: Row(
                  //           mainAxisAlignment: MainAxisAlignment.center,
                  //           children: [
                  //             Icon(Icons.done_all),
                  //             SizedBox(width: 10),
                  //             Text(
                  //               'No sub category',
                  //               style:
                  //               Theme.of(context).textTheme.labelLarge,
                  //             )
                  //           ],
                  //         ),
                  //       ))
                  //       : Container(
                  //     decoration: BoxDecoration(),
                  //     constraints: BoxConstraints(
                  //       maxHeight: 200,
                  //     ),
                  //     child: SingleChildScrollView(
                  //       child: Column(
                  //         children:[
                  //           // ListTile(
                  //           //   trailing: IconButton(
                  //           //     onPressed: () {
                  //           //
                  //           //     },
                  //           //     icon: Icon(Icons.delete),
                  //           //   ),
                  //           //   title: Text(e.title!),
                  //           // )
                  //         ]
                  //       ),
                  //     ),
                  //   );
                  // }),
                  // SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      PrimaryButton(
                        name: "Save",
                        icon: Icons.save,
                        onTap: () {
                          //  categoryProvider.addCategory(context);
                        },
                        color: Colors.green,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      PrimaryButton(
                        name: "Close",
                        icon: Icons.close,
                        onTap: () {
                          context.pop();
                        },
                        color: Colors.red,
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
