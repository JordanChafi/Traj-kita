import 'package:flutter/material.dart';
import 'package:trajekita/common/styles/spacing_styles.dart';
import 'package:trajekita/features/authentication/screens/login/widgets/login_form.dart';
import 'package:trajekita/features/authentication/screens/login/widgets/login_header.dart';
import 'package:trajekita/utils/constants/sizes.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          ///padding: const EdgeInsets.all(TSizes.defaultSpace),
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              const SizedBox(
                height: TSizes.xl,
              ),

              /// logos, title, subtitles
              const TLoginHeader(),

              /// Form
              const TLoginForm(),

              /// Divider
              //TFormDivider(dividerText: TTexts.orSignInWith.capitalize!),

              const SizedBox(
                width: TSizes.spaceBtwItems,
              ),

              /// Footer
              // const TSocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
