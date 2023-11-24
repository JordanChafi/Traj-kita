import 'package:flutter/material.dart';
import 'package:trajekita/features/authentication/screens/register/widgets/set_password_form.dart';
import 'package:trajekita/utils/constants/sizes.dart';
import 'package:trajekita/utils/helpers/helper_functions.dart';

class SetPassword extends StatefulWidget {
  const SetPassword({super.key});

  @override
  State<SetPassword> createState() => _SetPasswordState();
}

class _SetPasswordState extends State<SetPassword> {
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Title
              Text("Sécurité",
                  style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(
                height: TSizes.sm,
              ),
              Text("Ajouter un mot de passe pour sécuriser votre compte.",
                  style: Theme.of(context).textTheme.bodyMedium),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// Form
              const TSetPasswordForm(),
            ],
          ),
        ),
      ),
    );
  }
}
