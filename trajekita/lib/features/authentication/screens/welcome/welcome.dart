import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trajekita/common/styles/spacing_styles.dart';
import 'package:trajekita/features/authentication/screens/login/login.dart';
import 'package:trajekita/features/authentication/screens/register/signup.dart';
import 'package:trajekita/utils/constants/colors.dart';
import 'package:trajekita/utils/constants/image_strings.dart';
import 'package:trajekita/utils/constants/sizes.dart';
import 'package:trajekita/utils/constants/text_strings.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.1,
            vertical: screenHeight * 0.05,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(TImages.welcomeImage, height: screenHeight * 0.4),
              SizedBox(height: screenHeight * 0.03),
              Column(
                children: [
                  Text(
                    TTexts.welcomeTitle,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Text(
                    TTexts.welcomeSubtitle,
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.03),

              /// Sign In Button
              SizedBox(
                height: screenHeight * 0.03,
              ),

              /// Create Account Button
              SizedBox(height: screenHeight * 0.15),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Get.to(() => const SignupScreen()),
                  child: Text(TTexts.signUp),
                ),
              ),

              SizedBox(
                height: screenHeight * 0.03,
              ),

              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () => Get.to(() => const LoginScreen()),
                  child: const Text(
                    TTexts.signIn,
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
