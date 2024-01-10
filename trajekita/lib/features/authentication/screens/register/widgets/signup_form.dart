import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:trajekita/features/authentication/screens/forgotPassword/forgotPassword_otp/otp_screen.dart';
import 'package:trajekita/utils/constants/colors.dart';
import 'package:trajekita/utils/constants/sizes.dart';
import 'package:trajekita/utils/constants/text_strings.dart';
import 'package:http/http.dart' as http;

class TSignupForm extends StatelessWidget {

  final formKey = GlobalKey<FormState>();

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
        final Map<String, dynamic> responseData = json.decode(response.body);
        final String successMessage = responseData['message'];

        // Affichage du SnackBar de succès
        Get.snackbar(
          "Message de Succès",
          successMessage,
          snackPosition: SnackPosition.BOTTOM,
          margin: const EdgeInsets.all(30),
          backgroundColor: TColors.primary,
          icon: const Icon(Icons.check, color: Colors.white),
          shouldIconPulse: false,
          duration: const Duration(seconds: 3), // Durée du SnackBar de succès
          isDismissible: true, // Si le SnackBar est dismissible en cliquant dessus
          leftBarIndicatorColor: Colors.white, // Couleur de la barre latérale à gauche
          borderRadius: 10,
          forwardAnimationCurve: Curves.easeOutBack, // Courbe d'animation avant
          reverseAnimationCurve: Curves.easeIn, // Courbe d'animation arrière
        );

        // L'inscription a réussi, redirigez l'utilisateur vers la page suivante
        Get.to(() => const OTPScreen());
      } else {
        // Gérez les erreurs d'inscription
        final Map<String, dynamic> responseData = json.decode(response.body);
        final String errorMessage = responseData['error'];

        // Affichage du SnackBar d'erreur
        Get.snackbar(
          "Message d'Erreur",
          errorMessage,
          snackPosition: SnackPosition.BOTTOM,
          margin: const EdgeInsets.all(30),
          backgroundColor: TColors.primary,
          icon: const Icon(Icons.error, color: Colors.white),
          shouldIconPulse: false,
          duration: const Duration(seconds: 5), // Durée du SnackBar d'erreur
          isDismissible: true, // Si le SnackBar est dismissible en cliquant dessus
          leftBarIndicatorColor: Colors.white, // Couleur de la barre latérale à gauche
          borderRadius: 10,
          forwardAnimationCurve: Curves.easeOutBack, // Courbe d'animation avant
          reverseAnimationCurve: Curves.easeIn, // Courbe d'animation arrière
        );
      }

    } catch (e) {
      // Gérez les erreurs inattendues
      print('Erreur inattendue lors de l\'inscription: $e');
    }
  }

  @override
  Widget build(BuildContext context) {

    return Form(
      key: formKey,
      child: Column(
        children: [
          /// Fullname
          TextFormField(
            controller: fullNameController,
            expands: false,
            decoration: const InputDecoration(
              labelText: TTexts.fullname, 
              prefixIcon: Icon(Iconsax.user)
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Veuillez entrer votre nom complet.';
              }
              return null;
            },
          ),
          const SizedBox(height: TSizes.spaceBtwInputsFields),

          // Email
          TextFormField(
            controller: emailController,
            expands: false,
            decoration: const InputDecoration(
              labelText: TTexts.email,
              prefixIcon: Icon(Iconsax.direct_right)
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Veuillez entrer votre adresse mail.';
              }
              return null;
            },
          ),
          const SizedBox(height: TSizes.spaceBtwInputsFields),

          // Phone Number
          TextFormField(
            controller: phoneNumberController,
            keyboardType: TextInputType.phone,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            expands: false,
            decoration: const InputDecoration(
              labelText: TTexts.phoneNumber, prefixIcon: Icon(Iconsax.call)
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Veuillez entrer votre numero de téléphone.';
              }
              return null;
            },
          ),
          const SizedBox(height: TSizes.spaceBtwInputsFields),

          // Password
          TextFormField(
            controller: passwordController,
            expands: false,
            decoration: const InputDecoration(
              labelText: TTexts.password, prefixIcon: Icon(Iconsax.lock)
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Veuillez entrer votre mot de passe.';
              }
              return null;
            },
          ),
          // const SizedBox(height: TSizes.spaceBtwInputsFields),

          /// Terms & Privacy
          // const TTermsAndConditionCheckbox(),
          const SizedBox(height: TSizes.spaceBtwSections),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              //onPressed: () => Get.to(() => const OTPScreen()),
              onPressed: () {
                // Validation du formulaire
                if (formKey.currentState!.validate()){
                  // Récupération des valeurs de chaque champs 
                  final fullName = fullNameController.text;
                  final email = emailController.text;
                  final phoneNumber = phoneNumberController.text;
                  final password = passwordController.text;

                  registerUser(context, fullName, email, phoneNumber, password);
                }                
              },
              child: const Text(TTexts.createAccount),
            ),
          ),
        ],
      ),
    );
  }
}


