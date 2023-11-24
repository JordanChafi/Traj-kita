import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trajekita/common/styles/spacing_styles.dart';
import 'package:trajekita/utils/constants/colors.dart';
import 'package:trajekita/utils/constants/image_strings.dart';
import 'package:trajekita/utils/constants/sizes.dart';
import 'package:trajekita/utils/constants/text_strings.dart';

class OfferOrFind extends StatelessWidget {
  const OfferOrFind({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(
                height: TSizes.spaceBtwSections * 2,
              ),
              const Image(image: AssetImage(TImages.darkAppLogo), height: 200),
              const SizedBox(
                height: TSizes.spaceBtwInputsFields,
              ),
              const SizedBox(height: TSizes.spaceBtwSections * 6),
              Column(
                children: [
                  // Text(TTexts.welcomeTitle,style: Theme.of(context).textTheme.headlineMedium),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  Text(
                    "Profitez des nos offres !",
                    style: Theme.of(context).textTheme.headlineMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems - 5),
                  Text("Choisissez l'option qui vous convient",
                      style: Theme.of(context).textTheme.bodyMedium,
                      textAlign: TextAlign.center),
                ],
              ),
              const SizedBox(height: TSizes.spaceBtwInputsFields),

              /// Sign In Button

              const SizedBox(
                height: TSizes.spaceBtwInputsFields,
              ),

              /// Create Account Button

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  // onPressed: () => Get.to(() => const SignupScreen()),
                  onPressed: () {},
                  child: const Text("Trouver un trajet"),
                ),
              ),

              const SizedBox(
                height: TSizes.spaceBtwInputsFields,
              ),

              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  // onPressed: () => Get.to(() => const LoginScreen()),
                  onPressed: () {},
                  child: const Text(
                    "Proposer un trajet",
                    style: TextStyle(color: TColors.primary),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
