import 'package:ecommerceadmin/const/Values.dart';
import 'package:ecommerceadmin/widget/HoverEffect.dart';
import 'package:ecommerceadmin/widget/responsivelayout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DashBoardItemWidget extends StatelessWidget {
  final String label;
  final String value;
  final String icon;
  const DashBoardItemWidget({
    super.key,
    required this.label,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final isDesktop = Responsivelayout.isDesktop(context);
    return HoverEffect(builder: (isHover) {
      return AnimatedContainer(
          duration: DefaultValue.animationDuration,
          margin: const EdgeInsets.only(right: 10),
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: isHover
                ? Theme.of(context).colorScheme.primary.withOpacity(0.1)
                : Theme.of(context).colorScheme.primaryContainer,
          ),
          child: Row(
            children: [
              if (isDesktop)
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: label == "Total Order"
                        ? Theme.of(context).colorScheme.primary.withOpacity(0.2)
                        : label == "Pending Order"
                        ? const Color(0xffEE0000).withOpacity(0.2)
                        : label == "Processing Order"
                        ? const Color(0xff1400FC).withOpacity(0.2)
                        : Theme.of(context)
                        .colorScheme
                        .primary
                        .withOpacity(0.2),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  padding: const EdgeInsets.all(15),
                  child: SvgPicture.asset(
                    icon,
                    width: 25,
                  ),
                ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label,
                      style: Theme.of(context).textTheme.labelMedium,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      value,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ],
                ),
              )
            ],
          ));
    });
  }
}
