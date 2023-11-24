import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:trajekita/features/home/app_pages/settings/account/delete_account.dart';
import 'package:trajekita/features/home/app_pages/settings/profile/edit_profile.dart';
import 'package:trajekita/features/home/app_pages/settings/profile/widgets/profile_menu.dart';
import 'package:trajekita/features/home/app_pages/settings/profile/widgets/section_heading.dart';
import 'package:trajekita/utils/constants/colors.dart';
import 'package:trajekita/utils/constants/sizes.dart';

import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mon Profil"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Profile Picture
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    CircleAvatar(
                      radius:
                          50, // Ajuster la taille de l'image de profil selon vos besoins
                      backgroundImage: AssetImage(
                          'assets/images/profile_image.jpg'), // Remplacez le chemin par votre propre image
                    ),
                    const SizedBox(
                        height: TSizes.spaceBtwItems /
                            3), // Ajouter de l'espace entre l'image de profil et le texte
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Modifier Photo de Profil",
                        style: TextStyle(color: TColors.primary),
                      ),
                    ),
                  ],
                ),
              ),

              ///Details Profile
              const SizedBox(height: TSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),
              const TSectionHeading(
                title: "Mes Informations",
                showActionButton: false,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),

              TProfilMenu(
                onPressed: () => Get.to(() => EditProfileScreen(
                      title: 'Modifier Nom et Prénoms',
                      subTitle: 'Entrez votre Nom et Prénoms',
                      initialValue: "john Doe",
                    )),
                title: 'Nom & Prénoms',
                value: "john Doe",
              ),
              TProfilMenu(
                onPressed: () => Get.to(() => EditProfileScreen(
                      title: 'Modifier Email',
                      subTitle: 'Entrez votre nouvelle adresse e-mail',
                      initialValue: "johnDoe@gmail.com",
                    )),
                title: 'Email',
                value: "johnDoe@gmail.com",
              ),
              TProfilMenu(
                onPressed: () => Get.to(() => EditProfileScreen(
                      title: 'Modifier N° Téléphone',
                      subTitle: 'Entrez votre nouveau numéro de téléphone',
                      initialValue: "0102030405",
                    )),
                title: 'N° Téléphone',
                value: "0102030405",
              ),
              TProfilMenu(
                onPressed: () => Get.to(() => EditProfileScreen(
                      title: 'Modifier Genre',
                      subTitle: 'Sélectionnez votre genre',
                      initialValue: "Masculin",
                    )),
                title: 'Genre',
                value: "Masculin",
              ),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),

              Center(
                child: TextButton(
                  onPressed: () => Get.to(() => const DeleteAccountScreen()),
                  child: Text(
                    "Supprimer le Compte",
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          color: TColors.error,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
