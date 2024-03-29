import 'package:flutter/material.dart';
import 'package:trajekita/utils/constants/colors.dart';
import 'package:trajekita/utils/constants/sizes.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Changer votre Mot de Passe'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: TSizes.spaceBtwItems / 5,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Pour modifier votre Mot de Passe, veuillez renseigner les champs ci-dessous.",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  /// password
                  TextFormField(
                    expands: false,
                    obscureText: _obscureText,
                    decoration: InputDecoration(
                      labelText: "Mot de Passe",
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                        child: Icon(
                          _obscureText
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                      ),
                      labelStyle: TextStyle(
                        color: TColors.darkGrey, 
                      ),
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwInputsFields),

                  /// New Password
                  TextFormField(
                    expands: false,
                    obscureText: _obscureText,
                    decoration: InputDecoration(
                      labelText: "Nouveau Mot de Passe",
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                        child: Icon(
                          _obscureText
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                      ),
                      labelStyle: TextStyle(
                        color: TColors.darkGrey, 
                      ),
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwInputsFields),

                  /// Confirm password
                  TextFormField(
                    expands: false,
                    obscureText: _obscureText,
                    decoration: InputDecoration(
                      labelText: "Confirmer Mot de Passe",
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                        child: Icon(
                          _obscureText
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                      ),
                      labelStyle: TextStyle(
                        color: TColors.darkGrey, 
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('Valider',
                        style: TextStyle(color: TColors.textWhite)
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(TColors.primary),
                      ),
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
