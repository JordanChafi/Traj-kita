import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:trajekita/utils/constants/colors.dart';
import 'package:trajekita/utils/constants/image_strings.dart';

class MySidebar extends StatefulWidget {
  const MySidebar({super.key});

  @override
  State<MySidebar> createState() => _MySidebarState();
}

class _MySidebarState extends State<MySidebar> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text('John Doe'),
            accountEmail: const Text('JohnDoe@yopmail.com'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset(
                  TImages.sidebarProfile,
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            decoration: const BoxDecoration(
              color: TColors.primary,
              image: DecorationImage(
                image: AssetImage(
                  TImages.sidebarProfile,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Iconsax.user),
            title: const Text(
              'Profil',
            ),
            onTap: () {},
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.description_outlined),
            title: const Text(
              'Historique',
            ),
            onTap: () {},
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Iconsax.setting),
            title: const Text(
              'Paramètre',
            ),
            onTap: () {},
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Iconsax.logout),
            title: const Text(
              'Déconnexion',
              style: TextStyle(
                color: TColors.error,
              ),
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}


/// Profil
/// history
/// settings -->
    ///About 
    ///terms 
    ///privacy policy
    ///log out
