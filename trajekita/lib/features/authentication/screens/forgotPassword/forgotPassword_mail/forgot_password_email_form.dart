import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:trajekita/features/authentication/screens/forgotPassword/forgotPassword_otp/otp_screen.dart';
import 'package:trajekita/utils/constants/sizes.dart';
import 'package:trajekita/utils/constants/text_strings.dart';

class TForgotPasswordMailForm extends StatelessWidget {
  const TForgotPasswordMailForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          /// Email
          TextFormField(
            expands: false,
            decoration: const InputDecoration(
                labelText: TTexts.email,
                prefixIcon: Icon(Iconsax.direct_right)),
          ),

          const SizedBox(height: TSizes.spaceBtwInputsFields + 5),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => Get.to(() => const OTPScreen()),
              child: const Text("Envoyer"),
            ),
          ),
        ],
      ),
    );
  }
}
