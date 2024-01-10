import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trajekita/features/home/app_pages/settings/contact_us/contact_us.dart';
import 'package:trajekita/features/home/home/widgets/sidebar/sidebar.dart';
import 'package:trajekita/utils/constants/colors.dart';
import 'package:trajekita/utils/constants/sizes.dart';

class HelpAndSupportScreen extends StatefulWidget {
  @override
  State<HelpAndSupportScreen> createState() => _HelpAndSupportScreenState();
}

class _HelpAndSupportScreenState extends State<HelpAndSupportScreen> {
  bool _isExpanded = true;

  void _toggleExpanded() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        backgroundColor: TColors.white,
        title: const Text('Aide & Support'),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.menu), // Icône du menu
              onPressed: () {
                Scaffold.of(context)
                    .openDrawer(); // Ouvre le sidebar en appuyant sur l'icône du menu
              },
            );
          },
        ),
      ),
      drawer: const SidebarScreen(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Introduction
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                'Nous sommes là pour vous aider ! Si vous avez des questions ou des problèmes avec notre application, n"hésitez pas à nous contacter. Nous avons une équipe de support dédiée qui est disponible 24h/24 et 7j/7 pour vous aider.',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),

            // Comment nous contacter
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const ListTile(
                    title: Text('Par e-mail'),
                    subtitle: Text('Looto@support.com'),
                  ),
                  const ListTile(
                    title: Text('Par téléphone'),
                    subtitle: Text('+225 0102030405 / 0203040506'),
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections / 2),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => Get.to(() => const ContactUsScreen()),
                      child: const Text("Contactez-nous"),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(TColors.primary),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Foire aux questions
            // FAQWidget(),
          ],
        ),
      ),
    );
  }
}
