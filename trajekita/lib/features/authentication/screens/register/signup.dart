import 'package:flutter/material.dart';
import 'package:trajekita/features/authentication/screens/register/widgets/signup_form.dart';
import 'package:trajekita/utils/constants/image_strings.dart';
import 'package:trajekita/utils/constants/sizes.dart';
import 'package:trajekita/utils/constants/text_strings.dart';
import 'package:trajekita/utils/helpers/helper_functions.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
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

              const SizedBox(height: TSizes.spaceBtwSections),

              /// Title
              Text(TTexts.registerTitle,
                  style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// Form
              const TSignupForm(),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// Divider
              // TFormDivider(dividerText: TTexts.orSignInWith.capitalize!),
              // const SizedBox(height: TSizes.spaceBtwSections),

              /// Social Buttons
              // const TSocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
