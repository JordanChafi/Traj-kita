import 'package:flutter/material.dart';
import 'package:trajekita/utils/constants/image_strings.dart';
import 'package:trajekita/utils/constants/sizes.dart';
import 'package:trajekita/utils/helpers/helper_functions.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Politique de Confidentialité'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: TSizes.spaceBtwItems),

            // Texte
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Chez Looto, accessible depuis Looto.com, l'une de nos principales priorités est la confidentialité de nos visiteurs.",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Ce document de politique de confidentialité contient des types d'informations collectées et enregistrées par le covoiturage et la manière dont nous les utilisons.",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Si vous avez des questions supplémentaires ou avez besoin de plus d'informations sur notre politique de confidentialité, n'hésitez pas à nous contacter.",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Cette politique de confidentialité s'applique uniquement à nos activités en ligne et est valable pour les visiteurs de notre site Web en ce qui concerne les informations qu'ils ont partagées et/ou collectées en covoiturage.",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Cette politique ne s'applique pas aux informations collectées hors ligne ou via des canaux autres que ce site Web.",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Notre politique de confidentialité a été créée avec l'aide du générateur gratuit de politique de confidentialité.",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),

            // Espacement
            const SizedBox(height: 20),

            // Image d'équipe
            //Image.asset('assets/images/team.png'),

            // Titre
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                'Notre équipe',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),

            // Texte
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Notre équipe dévouée travaille sans relâche pour rendre le projet de covoiturage une réalité. Composée d"experts passionnés par la mobilité et les technologies innovantes, notre équipe allie créativité, compétence et engagement pour offrir la meilleure expérience de covoiturage possible.',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    SizedBox(height: TSizes.spaceBtwItems),
                    Text(
                      "Nous sommes une équipe diversifiée, regroupant des esprits créatifs, des développeurs talentueux, des experts en expérience utilisateur et bien d'autres professionnels dévoués. Notre objectif commun est de créer une plateforme de covoiturage conviviale, sécurisée et efficace, répondant aux besoins changeants des conducteurs et des passagers.",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    SizedBox(height: TSizes.spaceBtwItems),
                    Text(
                      "Chaque membre de notre équipe apporte une expertise unique, contribuant à façonner une solution de covoiturage complète et robuste. Nous croyons en la puissance de la collaboration et de l'innovation pour transformer la façon dont les gens se déplacent au quotidien. Ensemble, nous sommes déterminés à construire un avenir de mobilité durable et pratique pour tous.",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    SizedBox(height: TSizes.spaceBtwItems),
                    Text(
                      "Retrouvez-nous sur :",
                      style: Theme.of(context).textTheme.bodySmall,
                    )
                  ]),
            ),

            // Liens vers les réseaux sociaux
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Image.asset(
                      dark ? TImages.darkFacebook : TImages.lightFacebook,
                      fit: BoxFit.contain,
                      height: 70,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Image.asset(
                      dark ? TImages.darkTwitter : TImages.lightTwitter,
                      fit: BoxFit.contain,
                      height: 50,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Image.asset(
                      dark ? TImages.darkInstagram : TImages.lightInstagram,
                      fit: BoxFit.contain,
                      height: 57,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
