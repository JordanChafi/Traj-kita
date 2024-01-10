import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trajekita/features/authentication/screens/login/login.dart';
import 'package:trajekita/features/authentication/screens/onboarding/onboarding.dart';
import 'package:trajekita/features/authentication/screens/splashScreen/splashScreen.dart';
import 'package:trajekita/features/home/app_pages/messages/messagesScreen.dart';
import 'package:trajekita/features/home/app_pages/notifications/notifications_screen.dart';
import 'package:trajekita/features/home/app_pages/settings/about_us/about_us.dart';
import 'package:trajekita/features/home/app_pages/settings/account/change_password.dart';
import 'package:trajekita/features/home/app_pages/settings/account/delete_account.dart';
import 'package:trajekita/features/home/app_pages/settings/address/address.dart';
import 'package:trajekita/features/home/app_pages/settings/contact_us/contact_us.dart';
import 'package:trajekita/features/home/app_pages/settings/help_and_support/help_and_support.dart';
import 'package:trajekita/features/home/app_pages/settings/historic/historic.dart';
import 'package:trajekita/features/home/app_pages/settings/privacy_policy/privacy_policy.dart';
import 'package:trajekita/features/home/app_pages/settings/profile/profile.dart';
import 'package:trajekita/features/home/app_pages/settings/settings.dart';
import 'package:trajekita/features/home/home/findRide/cancellationScreen.dart';
import 'package:trajekita/features/home/home/findRide/list0fCarsAvailableForRideScreen.dart';
import 'package:trajekita/features/home/home/findRide/paymentScreen.dart';
import 'package:trajekita/features/home/home/offerRide/homeOfferRideScreen.dart';
import 'package:trajekita/features/home/home/widgets/search/search.dart';
import 'package:trajekita/features/home/home/widgets/sidebar/sidebar.dart';
import 'package:trajekita/utils/theme/theme.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 500),
      //home: OnBoardingScreen(),
      home: const LoginScreen(),
    );
  }

}
