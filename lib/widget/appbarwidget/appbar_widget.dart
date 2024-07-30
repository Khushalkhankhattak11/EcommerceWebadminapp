import 'package:ecommerceadmin/provider/AuthProvider.dart';
import 'package:ecommerceadmin/provider/ThemeProvider.dart';
import 'package:ecommerceadmin/widget/MyIconButton.dart';
import 'package:ecommerceadmin/widget/responsivelayout.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyAppBarWidget extends StatelessWidget {
  const MyAppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDesktop = Responsivelayout.isDesktop(context);
    final authProvider = Provider.of<AuthProvider>(context);
    final themeprovider = Provider.of<ThemeProvider>(context, listen: false);
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      child: Row(
        children: [
          SizedBox(width: 10),
          if (!isDesktop)
            IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: Icon(Icons.menu)),
          SizedBox(width: 20),
          if (isDesktop) Spacer(),
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "Search here...",
                fillColor: Theme.of(context).colorScheme.surface,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
              ),
            ),
          ),
          SizedBox(width: 20),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Consumer<ThemeProvider>(
                builder: (context, value, child) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MyIconButton(
                        icon: value.ThemeModes == ThemeMode.light
                            ? Icons.light_mode
                            : Icons.dark_mode,
                        onTap: () {
                          value.changeTheme(ThemeMode.dark);
                        },
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
          SizedBox(width: 20),
          SizedBox(width: 20),
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'logout') {
                authProvider.logout(context);
              } else if (value == 'profile') {}
            },
            tooltip: "",
            position: PopupMenuPosition.under,
            itemBuilder: (BuildContext context) => [
              PopupMenuItem<String>(
                value: 'profile',
                child: Text('Profile Settings'),
              ),
              PopupMenuItem<String>(
                value: 'logout',
                child: Text('Logout'),
              ),
            ],
            child: Container(
              padding: EdgeInsets.all(7),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    child: Text(
                      authProvider.auth.currentUser!.email![0].toUpperCase(),
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    authProvider.auth.currentUser!.email ?? "Root",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.primary),
                  ),
                  Icon(
                    Icons.keyboard_arrow_down_rounded,
                    size: 20,
                    color: Theme.of(context).colorScheme.primary,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
