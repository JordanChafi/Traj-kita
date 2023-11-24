import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:trajekita/features/authentication/screens/setPassword/set_password.dart';
import 'package:trajekita/utils/constants/colors.dart';
import 'package:trajekita/utils/constants/sizes.dart';
import 'package:trajekita/utils/constants/text_strings.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              TTexts.otpTitle,
              style: TextStyle(
                fontFamily: 'Coolvetica',
                fontWeight: FontWeight.bold,
                fontSize: 80.0,
              ),
            ),
            Text(TTexts.otpSubtitle,
                style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: TSizes.spaceBtwSections),
            const Text("Entrez le code reçu sur votre numéro de téléphone",
                textAlign: TextAlign.center),
            const SizedBox(height: TSizes.spaceBtwSections),
            OtpTextField(
              mainAxisAlignment: MainAxisAlignment.center,
              numberOfFields: 4,
              fillColor: Colors.black.withOpacity(0.07),
              filled: true,
              onSubmit: (code) => {
                // ignore: avoid_print
                print("Le Code OTP est => $code"),
              },
            ),
            const SizedBox(height: TSizes.spaceBtwSections + 5),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Get.to(() => const SetPassword()),
                child: const Text("Valider"),
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems + 10,
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Vous n'aviez pas reçu de code ? ",
                    style: TextStyle(color: Colors.black),
                  ),
                  TextSpan(
                    text: "Réessayer",
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      color: TColors.primary,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // Ajoutez votre logique ici
                      },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
