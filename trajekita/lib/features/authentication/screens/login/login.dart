import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trajekita/common/styles/spacing_styles.dart';
import 'package:trajekita/common/widgets/login_signup/form_divider.dart';
import 'package:trajekita/common/widgets/login_signup/social_buttons.dart';
import 'package:trajekita/features/authentication/screens/login/widgets/login_form.dart';
import 'package:trajekita/features/authentication/screens/login/widgets/login_header.dart';
import 'package:trajekita/utils/constants/sizes.dart';
import 'package:trajekita/utils/constants/text_strings.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              /// logos, title, subtitles
              const TLoginHeader(),

              /// Form
              const TLoginForm(),

              /// Divider
              TFormDivider(dividerText: TTexts.orSignInWith.capitalize!),

              const SizedBox(
                width: TSizes.spaceBtwItems,
              ),

              /// Footer
              const TSocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
