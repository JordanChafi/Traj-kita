import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:trajekita/features/home/app_pages/settings/account/change_password.dart';
import 'package:trajekita/features/home/app_pages/settings/account/delete_account.dart';
import 'package:trajekita/features/home/app_pages/settings/contact_us/contact_us.dart';
import 'package:trajekita/features/home/app_pages/settings/privacy_policy/privacy_policy.dart';
import 'package:trajekita/utils/constants/colors.dart';
import 'package:trajekita/utils/constants/sizes.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Paramètres'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Liste de boutons
            Column(
              children: [
                const SizedBox(
                  height: TSizes.defaultSpace,
                ),
                Builder(
                  builder: (context) {
                    ThemeData currentTheme = Theme.of(context);
                    // ignore: unused_local_variable
                    Color borderColor =
                        currentTheme.brightness == Brightness.light
                            ? TColors.primary
                            : Colors.transparent;

                    return Column(
                      children: [
                        // Bouton "Modifier mot de passe"
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal:
                                  8.0), // Ajustez la valeur horizontale selon vos besoins
                          child: Container(
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: borderColor, width: 1.0),
                              borderRadius:
                                  BorderRadius.circular(TSizes.borderRadiusLg),
                            ),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ChangePasswordScreen()),
                                );
                              },
                              child: ListTile(
                                leading: Icon(Iconsax.edit),
                                title: const Text('Modifier mot de passe'),
                                trailing: Icon(Iconsax.arrow_right_34),
                                tileColor: Colors.transparent,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),

                        // Bouton "Politique de confidentialité"
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: borderColor, width: 1.0),
                              borderRadius:
                                  BorderRadius.circular(TSizes.borderRadiusLg),
                            ),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          PrivacyPolicyScreen()),
                                );
                              },
                              child: ListTile(
                                leading: Icon(Icons.privacy_tip),
                                title: Text('Politique de confidentialité'),
                                trailing: Icon(Iconsax.arrow_right_34),
                                tileColor: Colors.transparent,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(
                          height: 15,
                        ),

                        // Bouton "Contactez-nous"
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: borderColor, width: 1.0),
                              borderRadius:
                                  BorderRadius.circular(TSizes.borderRadiusLg),
                            ),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ContactUsScreen()),
                                );
                              },
                              child: ListTile(
                                leading: Icon(Iconsax.call),
                                title: Text('Contactez-nous'),
                                trailing: Icon(Iconsax.arrow_right_34),
                                tileColor: Colors.transparent,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(
                          height: 15,
                        ),

                        // Bouton "Supprimer mon compte"
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: borderColor, width: 1.0),
                              borderRadius:
                                  BorderRadius.circular(TSizes.borderRadiusLg),
                            ),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          DeleteAccountScreen()),
                                );
                              },
                              child: ListTile(
                                leading: Icon(
                                  Icons.delete,
                                  //color: TColors.error,
                                ),
                                title: Text(
                                  'Supprimer mon compte',
                                  //style: TextStyle(color: TColors.error),
                                ),
                                trailing: Icon(
                                  Iconsax.arrow_right_34,
                                  //color: TColors.error,
                                ),
                                tileColor: Colors.transparent,
                              ),
                            ),
                          ),
                        ),

                        // ... (Ajoutez les autres éléments de la liste de boutons ici)
                      ],
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
