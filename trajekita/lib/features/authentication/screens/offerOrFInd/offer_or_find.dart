import 'package:flutter/material.dart';
import 'package:trajekita/utils/constants/image_strings.dart';
import 'package:trajekita/utils/constants/sizes.dart';

class OfferOrFind extends StatelessWidget {
  const OfferOrFind({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(height: 150, image: AssetImage(TImages.choiceImage)),
            ],
          ),
          // Espace entre l'image et le bouton
          const SizedBox(height: TSizes.spaceBtwSections * 2),
          // Bouton "Proposer un trajet" en bas
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Proposer un trajet'),
            ),
          ),
          const SizedBox(
            height: TSizes.spaceBtwSections,
          ),

          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () {},
              child: const Text('Trouver un trajet'),
            ),
          ),
        ],
      ),
    );
  }
}
