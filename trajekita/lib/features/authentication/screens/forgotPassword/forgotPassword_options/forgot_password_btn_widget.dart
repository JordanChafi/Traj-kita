import 'package:flutter/material.dart';
import 'package:trajekita/utils/constants/colors.dart';
import 'package:trajekita/utils/constants/sizes.dart';

class ForgotPasswordBtnWidget extends StatelessWidget {
  const ForgotPasswordBtnWidget({
    required this.btnIcon,
    required this.title,
    required this.subTitle,
    required this.onTap,
    Key? key,
    //required TextStyle titleStyle,
  }) : super(key: key);

  final IconData btnIcon;
  final String title, subTitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: TColors.other,
        ),
        child: Row(
          children: [
            Icon(btnIcon, size: TSizes.iconXl),
            const SizedBox(width: 10.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Text(
                  subTitle,
                  style: Theme.of(context).textTheme.bodySmall,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
