// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
class MyDrawerMenu extends StatelessWidget {
  final VoidCallback onPress;
  final String title;
  final String icon;
  final bool isSeleted;
  const MyDrawerMenu({
    super.key,
    required this.onPress,
    required this.title,
    required this.icon,
    this.isSeleted = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0,vertical: 3),
      child: ListTile(
        // horizontalTitleGap: 40,
        onTap: onPress,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        title: Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: isSeleted
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.onPrimaryContainer,
          ),
        ),
        leading: SvgPicture.asset(
          icon,
          width: 15,
          color: isSeleted
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.onPrimaryContainer,
        ),
        selected: isSeleted,
        selectedTileColor: Theme.of(context).colorScheme.primary.withOpacity(0.2),
        selectedColor: Colors.white,
      ),
    );
  }
}
