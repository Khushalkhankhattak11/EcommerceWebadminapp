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
    return Container(
      // height: 100,
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: label == "Total Order"
                    ? Theme.of(context).colorScheme.primary.withOpacity(0.2)
                    : label == "Pending Order"
                        ? Color(0xffEE0000).withOpacity(0.2)
                        : label == "Processing Order"
                            ? Color(0xff1400Fc).withOpacity(0.2)
                            : Theme.of(context)
                                .colorScheme
                                .primary
                                .withOpacity(0.2),
                borderRadius: BorderRadius.circular(100),
              ),
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
        ),
      ),
    );
  }
}
