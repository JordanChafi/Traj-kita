import 'package:flutter/material.dart';
import 'package:trajekita/features/authentication/screens/onboarding/onboarding.dart';
import 'package:trajekita/utils/constants/colors.dart';
import 'package:trajekita/utils/constants/image_strings.dart';
import 'package:trajekita/utils/constants/sizes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateToNextScreen();
  }

  void navigateToNextScreen() {
    Future.delayed(Duration(seconds: 6), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => OnBoardingScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.primaryBackground,
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: TSizes.imageThumbSize,
              height: TSizes.imageThumbSize,
              color: TColors.primaryBackground,
            ),
            Expanded(
              child: FittedBox(
                fit: BoxFit.contain,
                child: Image.asset(
                  TImages.lightAppLogo,
                  width: TSizes.imageThumbSize * 3,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}