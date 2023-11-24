import 'package:flutter/material.dart';
import 'package:trajekita/utils/constants/sizes.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('À propos de nous'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: TSizes.spaceBtwItems),
            // Logo
            Image.asset('assets/images/logo/Logo_dark.png'),

            // Titre
            // Padding(
            //   padding: const EdgeInsets.all(12),
            //   child: Text(
            //     'À propos de nous',
            //     style: Theme.of(context).textTheme.headline6,
            //   ),
            // ),

            // Sous-titre
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                'Qui sommes-nous ?',
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.start,
              ),
            ),

            // Texte
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nous sommes une entreprise qui facilite le covoiturage. Nous connectons des conducteurs et des passagers qui se rendent au même endroit. Notre objectif est de rendre le covoiturage plus facile, plus accessible et plus abordable.',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Nous utilisons la technologie pour connecter les conducteurs et les passagers. Notre application mobile permet aux conducteurs de créer des trajets et aux passagers de trouver des trajets qui correspondent à leurs besoins.',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Nous sommes passionnés par le covoiturage. Nous pensons que c"est une solution durable pour la mobilité. Le covoiturage permet de réduire les émissions de gaz à effet de serre, d"améliorer la circulation et de réduire les coûts de transport.',
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
                      'assets/images/logo/social/facebook.png',
                      fit: BoxFit.contain,
                      height: 70,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Image.asset(
                      'assets/images/logo/social/x.png',
                      fit: BoxFit.contain,
                      height: 55,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Image.asset(
                      'assets/images/logo/social/instagram.jpeg',
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
