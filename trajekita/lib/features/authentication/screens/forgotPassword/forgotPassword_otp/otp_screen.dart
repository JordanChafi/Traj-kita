import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:trajekita/utils/constants/sizes.dart';
import 'package:trajekita/utils/constants/text_strings.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              TTexts.otpTitle,
              style: TextStyle(
                fontFamily: 'Coolvetica',
                fontWeight: FontWeight.bold,
                fontSize: 80.0,
              ),
            ),
            Text(TTexts.otpSubtitle.toUpperCase(),
                style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 40.0),
            const Text(TTexts.otpMessage, textAlign: TextAlign.center),
            const SizedBox(height: 20.0),
            OtpTextField(
              mainAxisAlignment: MainAxisAlignment.center,
              numberOfFields: 5,
              fillColor: Colors.black.withOpacity(0.1),
              filled: true,
              onSubmit: (code) => {
                // ignore: avoid_print
                print("Le Code OTP est => $code"),
              },
            ),
            const SizedBox(height: 20.0),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text("Suivant"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
