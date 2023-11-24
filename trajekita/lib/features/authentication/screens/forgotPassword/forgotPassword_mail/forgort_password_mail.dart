import 'package:flutter/material.dart';
import 'package:trajekita/features/authentication/screens/forgotPassword/forgotPassword_mail/forgot_password_email_form.dart';
import 'package:trajekita/utils/constants/sizes.dart';
//import 'package:trajekita/utils/helpers/helper_functions.dart';

class ForgotPasswordMailScreen extends StatelessWidget {
  const ForgotPasswordMailScreen({super.key});

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
              Text("Réinitialisation par Email",
                  style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              Text(
                  "Renseignez votre adresse Mail pour réinitialiser votre Mot de Passe.",
                  style: Theme.of(context).textTheme.bodyMedium),
              Text("Un code Otp vous sera envoyé à votre compte par la suite."),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// Form
              const TForgotPasswordMailForm(),
              const SizedBox(height: TSizes.spaceBtwSections),
            ],
          ),
        ),
      ),
    );
  }
}
