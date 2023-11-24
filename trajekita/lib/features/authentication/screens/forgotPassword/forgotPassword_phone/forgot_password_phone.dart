import 'package:flutter/material.dart';
import 'package:trajekita/features/authentication/screens/forgotPassword/forgotPassword_phone/forgot_password_phone_form.dart';
import 'package:trajekita/utils/constants/sizes.dart';
///import 'package:trajekita/utils/helpers/helper_functions.dart';

class ForgotPasswordPhoneScreen extends StatelessWidget {
  const ForgotPasswordPhoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //const SizedBox(height: TSizes.spaceBtwSections),

              /// Title
              Text("Réinitialisation par Numéro de Téléphone",
                  style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              Text(
                  "Renseignez votre numéro de téléphone pour réinitialiser votre Mot de Passe.",
                  style: Theme.of(context).textTheme.bodyMedium),
              const Text(
                  "Un code Otp vous sera envoyé à votre compte par la suite."),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// Form
              const TForgotPasswordPhoneForm(),
              const SizedBox(height: TSizes.spaceBtwSections),
            ],
          ),
        ),
      ),
    );
  }
}
