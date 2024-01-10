import 'package:flutter/material.dart';
import 'package:trajekita/features/home/app_pages/settings/about_us/about_us.dart';
import 'package:trajekita/features/home/app_pages/settings/address/address.dart';
import 'package:trajekita/features/home/app_pages/settings/help_and_support/help_and_support.dart';
import 'package:trajekita/features/home/app_pages/settings/historic/historic.dart';
import 'package:trajekita/features/home/app_pages/settings/profile/profile.dart';
import 'package:trajekita/features/home/app_pages/settings/settings.dart';
import 'package:trajekita/utils/constants/colors.dart';

class SidebarScreen extends StatelessWidget {
  const SidebarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        // Ajouter une propriété backgroundColor pour définir la couleur de fond de la barre latérale
        //backgroundColor: Colors.transparent,
        width: MediaQuery.of(context).size.width *
            0.6, // Largeur personnalisée pour la barre latérale
        child: Column(
          children: <Widget>[
            const UserAccountsDrawerHeader(
              accountName: Text("John Doe"),
              accountEmail: Text("johnDoe@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/images/sidebar/profile.png'),
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.person),
                    title: const Text(
                      'Mon Profil',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    onTap: () {
                      // Ajoutez ici la logique pour naviguer vers la page Mon Profil
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (BuildContext context) => const ProfileScreen(),
                      //   ),
                      // );
                    },
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.location_on),
                    title: const Text(
                      'Mes adresses',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    onTap: () {
                      // Ajoutez ici la logique pour naviguer vers la page Mes Adresses
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => const AddressScreen(),
                        ),
                      );
                    },
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.history),
                    title: const Text(
                      'Mon historique',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    onTap: () {
                      // Ajoutez ici la logique pour naviguer vers la page Mon Historique
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => const HistoryScreen(),
                        ),
                      );
                    },
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.info),
                    title: const Text(
                      'A Propos de Nous',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    onTap: () {
                      // Ajoutez ici la logique pour naviguer vers la page A Propos de Nous
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => const AboutUsScreen(),
                        ),
                      );
                    },
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text(
                      'Paramètres',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    onTap: () {
                      // Ajoutez ici la logique pour naviguer vers la page Paramètres
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (BuildContext context) => const SettingsScreen(),
                      //   ),
                      // );
                    },
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.help),
                    title: const Text(
                      'Aide & Support',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    onTap: () {
                      // Ajoutez ici la logique pour naviguer vers la page Aide & Support
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              HelpAndSupportScreen(),
                        ),
                      );
                    },
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.logout, color: TColors.error),
                    title: const Text(
                      'Déconnexion',
                      style: TextStyle(
                          color: TColors.error,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                    onTap: () {
                      // Ajoutez ici la logique pour la déconnexion
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
        // ),
      ),
    );
  }
}
