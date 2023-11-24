import 'package:flutter/material.dart';
import 'package:trajekita/utils/constants/image_strings.dart';
import 'package:trajekita/utils/constants/sizes.dart';
import 'package:trajekita/utils/constants/text_strings.dart';
import 'package:trajekita/utils/helpers/helper_functions.dart';

class TLoginHeader extends StatelessWidget {
  const TLoginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
                height: 150,
                image: AssetImage(
                    dark ? TImages.lightAppLogo : TImages.darkAppLogo)),
          ],
        ),
        const SizedBox(height: TSizes.xl),
        Text(
          TTexts.loginTitle,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: TSizes.sm),
        Text(TTexts.loginSubtitle,
            style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}
