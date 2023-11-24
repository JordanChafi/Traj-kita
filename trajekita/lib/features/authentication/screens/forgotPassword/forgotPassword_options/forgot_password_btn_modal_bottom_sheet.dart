import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trajekita/features/authentication/screens/forgotPassword/forgotPassword_mail/forgort_password_mail.dart';
import 'package:trajekita/features/authentication/screens/forgotPassword/forgotPassword_options/forgot_password_btn_widget.dart';
import 'package:trajekita/features/authentication/screens/forgotPassword/forgotPassword_phone/forgot_password_phone.dart';
import 'package:trajekita/utils/constants/sizes.dart';
import 'package:trajekita/utils/constants/text_strings.dart';

class ForgotPasswordScreen {
  static Future<dynamic> modalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      builder: (context) => Container(
        height: 300,
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(TTexts.forgotPasswordTitle1,
                style: Theme.of(context).textTheme.headlineMedium),
            Text(TTexts.forgotPasswordSubtitle1,
                style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: TSizes.spaceBtwItems),
            ForgotPasswordBtnWidget(
              onTap: () {
                Navigator.pop(context);
                Get.to(() => const ForgotPasswordMailScreen());
              },
              title: TTexts.email,
              subTitle: TTexts.resetViaEmail,
              btnIcon: Icons.mail_outline_rounded,
            ),
            const SizedBox(
              height: 15.0,
            ),
            ForgotPasswordBtnWidget(
              onTap: () {
                Navigator.pop(context);
                Get.to(() => const ForgotPasswordPhoneScreen());
              },
              title: TTexts.phoneNumber,
              subTitle: TTexts.resetViaPhone,
              btnIcon: Icons.call,
            ),
          ],
        ),
      ),
    );
  }
}
