import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trajekita/features/authentication/controllers.onboarding/onboarding_controller.dart';
import 'package:trajekita/features/authentication/screens/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:trajekita/features/authentication/screens/onboarding/widgets/onboarding_next_button.dart';
import 'package:trajekita/utils/constants/image_strings.dart';
import 'package:trajekita/utils/constants/text_strings.dart';
import 'widgets/onboarding_page.dart';
//import 'widgets/onboarding_skip.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return Scaffold(
      body: Stack(
        children: [
          /// Scrollable Pages
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(
                image: TImages.onBoardingImage1,
                title: TTexts.onBoardingTitle1,
                subTitle: TTexts.onBoardingSubtitle1,
              ),
              OnBoardingPage(
                image: TImages.onBoardingImage2,
                title: TTexts.onBoardingTitle2,
                subTitle: TTexts.onBoardingSubtitle2,
              ),
              OnBoardingPage(
                image: TImages.onBoardingImage3,
                title: TTexts.onBoardingTitle3,
                subTitle: TTexts.onBoardingSubtitle3,
              ),
            ],
          ),

          /// Skip Button
          //const OnBoardingSkip(),

          /// Dot Navigation SmoothPageIndicator
          const OnBoardingDotNavigation(),

          const OnBoardingNextButton(),
        ],
      ),
    );
  }
}
