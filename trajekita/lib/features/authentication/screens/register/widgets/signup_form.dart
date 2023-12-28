import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:trajekita/features/authentication/screens/forgotPassword/forgotPassword_otp/otp_screen.dart';
import 'package:trajekita/utils/constants/sizes.dart';
import 'package:trajekita/utils/constants/text_strings.dart';
// import 'package:trajekita/utils/helpers/helper_functions.dart';

import 'package:http/http.dart' as http;


class TSignupForm extends StatelessWidget {

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  
  TSignupForm({
    Key? key,
  }) : super(key: key);


  Future<void> registerUser(
    BuildContext context,
    String fullName,
    String email,
    String phoneNumber,
    String password,
  ) async {

    try {
      final response = await http.post(
        Uri.parse('https://192.168.1.23:4000/api/users/register'),
        body: {
          'firstName': fullName.split(' ')[0],
          'lastName': fullName.split(' ')[1],
          'email': email,
          'phone': phoneNumber,
          'password': password,
        },
      );


      if (response.statusCode == 200) {
        // L'inscription a réussi, redirigez l'utilisateur vers la page suivante
        // ou effectuez d'autres actions nécessaires
        Get.to(() => const OTPScreen());
      } else {
        // Gérez les erreurs d'inscription
        final Map<String, dynamic> responseData = json.decode(response.body);
        final String errorMessage = responseData['error'];
        // Affichez le message d'erreur à l'utilisateur
        // Vous pouvez utiliser un Scaffold pour afficher une SnackBar par exemple
         Get.snackbar(
          'Erreur d\'inscription',
          errorMessage,
          backgroundColor: Colors.red,
        );
      }
    } catch (e) {
      // Gérez les erreurs inattendues
      print('Erreur inattendue lors de l\'inscription: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    // final dark = THelperFunctions.isDarkMode(context);

    return Form(
      child: Column(
        children: [
          /// Fullname
          TextFormField(
            expands: false,
            decoration: const InputDecoration(
                labelText: TTexts.fullname, prefixIcon: Icon(Iconsax.user)),
          ),
          const SizedBox(height: TSizes.spaceBtwInputsFields),

          // Email
          TextFormField(
            expands: false,
            decoration: const InputDecoration(
                labelText: TTexts.email,
                prefixIcon: Icon(Iconsax.direct_right)),
          ),
          const SizedBox(height: TSizes.spaceBtwInputsFields),

          // Phone Number
          TextFormField(
            expands: false,
            decoration: const InputDecoration(
                labelText: TTexts.phoneNumber, prefixIcon: Icon(Iconsax.call)),
          ),
          const SizedBox(height: TSizes.spaceBtwInputsFields),

          // Password
          TextFormField(
            expands: false,
            decoration: const InputDecoration(
                labelText: TTexts.password, prefixIcon: Icon(Iconsax.lock)),
          ),
          const SizedBox(height: TSizes.spaceBtwInputsFields),

          /// Terms & Privacy
          // const TTermsAndConditionCheckbox(),
          const SizedBox(height: TSizes.spaceBtwSections),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              //onPressed: () => Get.to(() => const OTPScreen()),
              onPressed: () {

                final fullName = fullNameController.text; // récupération de la valeur du champ de texte du nom complet
                final email = emailController.text; // récupération la valeur du champ de texte de l'e-mail
                final phoneNumber = phoneNumberController.text; // récupération la valeur du champ de texte du numéro de téléphone
                final password = passwordController.text; // récupération la valeur du champ de texte du mot de passe

                registerUser(context, fullName, email, phoneNumber, password);
              },
              child: const Text(TTexts.createAccount),
            ),
          ),
        ],
      ),
    );
  }
}


