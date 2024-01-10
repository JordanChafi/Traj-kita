import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:trajekita/features/home/home/widgets/sidebar/sidebar.dart';
import 'package:trajekita/utils/constants/colors.dart';
import 'package:trajekita/utils/constants/sizes.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColors.white,
        title: const Text('Historique'),
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
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: TSizes.spaceBtwSections - 2,
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: HistoryItem(
                name: 'Achat 1',
                result: true,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: HistoryItem(
                name: 'Achat 2',
                result: false,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: HistoryItem(
                name: 'Achat 1',
                result: true,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: HistoryItem(
                name: 'Achat 2',
                result: false,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: HistoryItem(
                name: 'Achat 1',
                result: true,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: HistoryItem(
                name: 'Achat 2',
                result: false,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: HistoryItem(
                name: 'Achat 2',
                result: false,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: HistoryItem(
                name: 'Achat 1',
                result: true,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: HistoryItem(
                name: 'Achat 2',
                result: false,
              ),
            ),

            SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            // Ajoutez d'autres éléments d'historique ici si nécessaire
          ],
        ),
      ),
    );
  }
}

class HistoryItem extends StatelessWidget {
  final String name;
  final bool result;

  const HistoryItem({
    Key? key,
    required this.name,
    required this.result,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: result ? TColors.primary : TColors.error,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(width: 8),
            Text(
              name,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                // Ajoutez ici la logique correspondant à cet élément d'historique
              },
              child: result
                  ? const Icon(
                      Icons.check_circle,
                      color: TColors.success,
                      size: 20,
                    )
                  : const Icon(
                      Iconsax.close_circle,
                      color: TColors.error,
                      size: 20,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}