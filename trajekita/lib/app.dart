import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trajekita/features/authentication/screens/onboarding/onboarding.dart';
import 'package:trajekita/utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 500),
      home: const OnBoardingScreen(),
    );
  }
}
