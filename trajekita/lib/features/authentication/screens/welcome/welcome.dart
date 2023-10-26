import 'package:flutter/material.dart';
import 'package:trajekita/utils/constants/colors.dart';
import 'package:trajekita/utils/constants/image_strings.dart';
import 'package:trajekita/utils/constants/sizes.dart';
import 'package:trajekita/utils/constants/text_strings.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Image(image: AssetImage(TImages.welcomeImage), height: 24),
          Column(
            children: [
              Text(TTexts.welcomeTitle,
                  style: Theme.of(context).textTheme.headlineLarge),
              Text(TTexts.welcomeSubtitle,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    shape: const RoundedRectangleBorder(),
                    foregroundColor: TColors.borderPrimary,
                    side: const BorderSide(color: TColors.primary),
                    padding: const EdgeInsets.symmetric(
                        vertical: TSizes.buttonHeight),
                  ),
                  child: const Text(TTexts.signIn),
                ),
              ),
              const SizedBox(width: 10.0),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    shape: const RoundedRectangleBorder(),
                    foregroundColor: TColors.white,
                    backgroundColor: TColors.buttonPrimary,
                    side: const BorderSide(color: TColors.primary),
                    padding: const EdgeInsets.symmetric(
                        vertical: TSizes.buttonHeight),
                  ),
                  child: const Text(TTexts.signUp),
                ),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
