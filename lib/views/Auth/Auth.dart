import 'package:ecommerceadmin/views/Auth/Widget/AuthFields.dart';
import 'package:ecommerceadmin/views/Auth/Widget/AuthInfo.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              // height: 500,
              width: w / 1.6,
              child: const Row(
                children: [
                  Expanded(child: AuthInfo()),
                  Expanded(child: AuthFields()),
                ],
              ),
            ),
          ],
        ),
      ],
    ));
  }
}
