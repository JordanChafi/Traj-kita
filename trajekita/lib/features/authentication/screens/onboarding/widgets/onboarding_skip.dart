import 'package:flutter/material.dart';
import 'package:trajekita/utils/constants/sizes.dart';
import 'package:trajekita/utils/device/device_utility.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: TDeviceUtils.getAppBarHeight(),
      right: TSizes.defaultSpace,
      child: TextButton(
        onPressed: () {},
        child: const Text('Passer >>'),
      ),
    );
  }
}
