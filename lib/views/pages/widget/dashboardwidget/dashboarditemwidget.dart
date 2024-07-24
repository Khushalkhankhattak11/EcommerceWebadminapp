import 'package:ecommerceadmin/const/Values.dart';
import 'package:ecommerceadmin/widget/HoverEffect.dart';
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
    return HoverEffect(builder: (isHover) {
      return AnimatedContainer(
          duration: DefaultValue.animationDuration,
          margin: const EdgeInsets.only(right: 10),
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: isHover
                ? Theme.of(context).colorScheme.primary.withOpacity(0.1)
                : Theme.of(context).colorScheme.primaryContainer,
          ),
          child: Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: label == "Total Order"
                      ? Theme.of(context).colorScheme.primary.withOpacity(0.2)
                      : label == "Pending Order"
                      ? Color(0xffEE0000).withOpacity(0.2)
                      : label == "Processing Order"
                      ? Color(0xff1400FC).withOpacity(0.2)
                      : Theme.of(context)
                      .colorScheme
                      .primary
                      .withOpacity(0.2),
                  borderRadius: BorderRadius.circular(100),
                ),
                padding: EdgeInsets.all(15),
                child: SvgPicture.asset(
                  icon,
                  width: 25,
                ),
              ),
              SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  Text(
                    value,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ],
              )
            ],
          ));
    });
  }
}
