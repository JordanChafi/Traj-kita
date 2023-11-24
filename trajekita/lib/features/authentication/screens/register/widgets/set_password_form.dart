import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:trajekita/features/authentication/screens/offerOrFInd/offer_or_find.dart';
import 'package:trajekita/utils/constants/sizes.dart';
import 'package:trajekita/utils/constants/text_strings.dart';

class TSetPasswordForm extends StatefulWidget {
  const TSetPasswordForm({Key? key}) : super(key: key);

  @override
  State<TSetPasswordForm> createState() => _TSetPasswordFormState();
}

class _TSetPasswordFormState extends State<TSetPasswordForm> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          /// password
          TextFormField(
            expands: false,
            obscureText: _obscureText,
            decoration: InputDecoration(
              labelText: TTexts.password,
              prefixIcon: Icon(Iconsax.lock),
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                child: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                ),
              ),
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwInputsFields),

          /// New Password
          TextFormField(
            expands: false,
            obscureText: _obscureText,
            decoration: InputDecoration(
              labelText: TTexts.password,
              prefixIcon: Icon(Iconsax.lock),
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                child: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                ),
              ),
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwSections),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                _showSuccessModal(context); // Afficher le modal de succès
              },
              child: const Text("Enregistrer"),
            ),
          ),
        ],
      ),
    );
  }

  void _showSuccessModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Image.asset(
                'assets/images/icons/success.png',
                height: 100,
              ),
              SizedBox(height: TSizes.spaceBtwSections),
              Text(
                'Votre compte a bien été enregistré. Vous serez redirigé vers la page d’accueil en quelques secondes.',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: TSizes.spaceBtwSections),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Get.to(() => const OfferOrFind()),
                  child: const Text("Continuer"),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
