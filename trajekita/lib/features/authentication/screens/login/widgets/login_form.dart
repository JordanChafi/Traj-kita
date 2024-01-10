import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:trajekita/features/authentication/screens/forgotPassword/forgotPassword_options/forgot_password_btn_modal_bottom_sheet.dart';
import 'package:trajekita/features/authentication/screens/register/signup.dart';
import 'package:trajekita/features/home/home_screen.dart';
import 'package:trajekita/requests/models/user_models.dart';
import 'package:trajekita/requests/providers/user_provider.dart';
import 'package:trajekita/requests/services/auth_services.dart';
import 'package:trajekita/utils/constants/colors.dart';
import 'package:trajekita/utils/constants/sizes.dart';
import 'package:trajekita/utils/constants/text_strings.dart';

class TLoginForm extends StatefulWidget {
  const TLoginForm({
    super.key,
  });

  @override
  State<TLoginForm> createState() => _TLoginFormState();
}

class _TLoginFormState extends State<TLoginForm> {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final UserProvider _userProvider = UserProvider();

  void _login() async {
    if (_formKey.currentState!.validate()) {
        print("je suis là");
      
      try {
        final User user = await _userProvider.loginUser(
          emailController.text,
          passwordController.text,
        );

        print("Je suis là");

        // Affichage du SnackBar
        Get.snackbar(
          'Connexion réussie',
          'Bienvenue, ${user.firstName}!',
          snackPosition: SnackPosition.BOTTOM,
          margin: const EdgeInsets.all(30),
          backgroundColor: TColors.primary,
          icon: const Icon(Icons.check, color: Colors.white),
          shouldIconPulse: false,
          duration: const Duration(seconds: 5),
          isDismissible: true,
          leftBarIndicatorColor: Colors.white,
          forwardAnimationCurve: Curves.easeOutBack,
          reverseAnimationCurve: Curves.easeIn,
        );
        
        // Redirection vers la page suivante
        Get.to(() => const HomeScreen());
      } catch (error) {
        // Récupération de l'erreur dans le user_provider
        
      }
    }
  }

  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
        child: Column(
          children: [
            /// Email
            TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.direct_right),
                  labelText: TTexts.email,
                ),
                validator: (value) {
                  if (value!.isEmpty || !RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                    return 'Veuillez entrer une adresse e-mail valide';
                  }
                  return null;
                },
              ),
            const SizedBox(
              height: TSizes.spaceBtwInputsFields,
            ),

            /// Password
            TextFormField(
                controller: passwordController,
                obscureText: _obscureText,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Iconsax.password_check),
                  labelText: TTexts.password,
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
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Veuillez entrer votre mot de passe';
                  }
                  return null;
                },
              ),

            const SizedBox(height: TSizes.spaceBtwInputsFields / 2),

            /// Remember Me & Forgot Password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Remember Me
                // Row(
                //   children: [
                //     Checkbox(value: true, onChanged: (value) {}),
                //     const Text(TTexts.rememberMe),
                //   ],
                // ),

                /// Forgot Password
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      ForgotPasswordScreen.modalBottomSheet(context);
                    },
                    child: const Text(
                      TTexts.forgotPassword,
                      style: TextStyle(color: TColors.primary),
                    ),
                    //style: Color(TColors.primary),
                  ),
                )
              ],
            ),
            const SizedBox(height: TSizes.spaceBtwItems),

            /// Sign In Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {

                  _login();
                //  if( _formKey.currentState!.validate()){
                //     // print(emailController.text);
                //     String email = emailController.text;
                //     String password = passwordController.text;

                //     String result =  user
                //  }
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(TColors.primary),
                ),
                child: const Text(TTexts.signIn),
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputsFields,
            ),

            /// Create Account Button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => Get.to(() => const SignupScreen()),
                child: const Text(
                  TTexts.createAccount,
                  style: TextStyle(color: TColors.primary),
                ),
              ),
            ),
            // const SizedBox(height: TSizes.spaceBtwSections,),
          ],
        ),
      )
    );
  }
}
