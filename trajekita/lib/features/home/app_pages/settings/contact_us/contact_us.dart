import 'package:flutter/material.dart';
import 'package:trajekita/utils/constants/colors.dart';
import 'package:trajekita/utils/constants/sizes.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contactez-nous'),
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
            // Comment nous contacter
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  ListTile(
                    title: Text('Siège'),
                    subtitle: Text('Abidjan, cocody Angré 8e tranche'),
                  ),
                  ListTile(
                    title: Text('Adresse Email'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('support@looto.com'),
                        Text('info@looto.com'),
                      ],
                    ),
                  ),
                  ListTile(
                    title: Text('Contact'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('+225 0102030405'),
                        Text('+225 0203040506'),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(
              height: TSizes.spaceBtwSections / 3,
            ),

            Center(
              child: Text(
                'Rediger votre message',
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),

            // Formulaire de contact
            Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                child: Column(
                  children: [
                    /// fullname
                    TextFormField(
                      expands: false,
                      decoration: const InputDecoration(
                        labelText: "Nom & Prénoms",
                      ),
                    ),
                    const SizedBox(height: TSizes.spaceBtwInputsFields),

                    /// email
                    TextFormField(
                      expands: false,
                      decoration: const InputDecoration(
                        labelText: "Email",
                      ),
                    ),
                    const SizedBox(height: TSizes.spaceBtwInputsFields),

                    /// Message
                    TextFormField(
                      expands: false,
                      maxLines: 5,
                      decoration: const InputDecoration(
                          labelText: "Message", alignLabelWithHint: true),
                    ),

                    const SizedBox(height: TSizes.spaceBtwSections),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text('Envoyer',
                            style: TextStyle(color: TColors.textWhite)),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(TColors.primary),
                            ),
                      ),
                    ),
                    const SizedBox(height: TSizes.spaceBtwSections),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
