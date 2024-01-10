import 'package:flutter/material.dart';
import 'package:trajekita/requests/providers/user_provider.dart';
import 'package:trajekita/utils/constants/colors.dart';
import 'package:trajekita/utils/constants/sizes.dart';

class DeleteAccountScreen extends StatelessWidget {
  final int userId; // Ajoutez cette ligne pour déclarer userId

  const DeleteAccountScreen({Key? key, required this.userId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Supprimer le compte'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Êtes-vous sûr de vouloir supprimer votre compte ?',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 20),
            Text(
              'Cette action est irréversible. Vous ne pourrez plus accéder à votre compte ou à vos données.',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: TSizes.spaceBtwSections),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  await UserProvider().deleteUser(userId);
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    TColors.error), // Couleur d'arrière-plan rouge
                  side: MaterialStateProperty.all(
                    const BorderSide(color: TColors.error)), // Bordure rouge
                ),
                child: const Text('Supprimer le compte', style: TextStyle(color: TColors.textWhite)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
