import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:trajekita/utils/constants/colors.dart';
import 'package:trajekita/utils/constants/sizes.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mes Adresses'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: AddressItem(
                name: 'Domicile',
                location: '123, Yopougon Maroc',
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: AddressItem(
                name: 'Bureau',
                location: '456, Cocody Angré',
              ),
            ),
            // Ajoutez d'autres éléments d'adresse ici si nécessaire
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Ajoutez ici la logique pour ajouter une nouvelle adresse
          _showAddModal(context);
        },
        child: const Icon(
          Icons.add,
          color: TColors.white, // Couleur de l'icône
        ),
        backgroundColor: TColors.primary, // Couleur de fond du bouton
      ),
    );
  }
}

class AddressItem extends StatelessWidget {
  final String name;
  final String location;

  const AddressItem({
    Key? key,
    required this.name,
    required this.location,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: TColors.primary, width: 1.0),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(13.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Iconsax.location_tick,
              size: 20,
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 2),
                Text(
                  location,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ],
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                _showEditOrDeleteModal(context);
              },
              child: Icon(
                Iconsax.edit,
                size: 20,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void _showAddModal(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return Container(
        height: 320, // Hauteur personnalisée pour le modal
        padding: EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Ajouter une Adresse',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: TSizes.spaceBtwSections),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Nom de l\'adresse',
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Emplacement géographique',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Ajoutez ici la logique pour l'ajout de l'adresse
                Navigator.pop(context); // Ferme la boîte de dialogue modale
              },
              child: Text('Ajouter l\'Adresse'),
            ),
          ],
        ),
      );
    },
  );
}

void _showEditOrDeleteModal(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return Container(
        padding: EdgeInsets.all(18.0),
        child: Wrap(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.edit),
              title: Text('Modifier'),
              onTap: () {
                Navigator.pop(context); // Ferme le premier modal
                _showEditModal(context); // Ouvre le second modal pour modifier
              },
            ),
            ListTile(
              leading: Icon(Icons.delete),
              title: Text('Supprimer'),
              onTap: () {
                // Ajoutez ici la logique pour la suppression de l'adresse
                Navigator.pop(context); // Ferme le premier modal
                _showDeleteConfirmation(context);
              },
            ),
          ],
        ),
      );
    },
  );
}

void _showEditModal(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return Container(
        height: 330, // Hauteur personnalisée pour le modal
        padding: EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Modifier cette Adresse',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: TSizes.spaceBtwSections),
            TextFormField(
              initialValue:
                  'Domicile', // Remplacez par la valeur de l'adresse actuelle
              decoration: InputDecoration(
                labelText: 'Nom de l\'adresse',
              ),
            ),
            SizedBox(height: TSizes.spaceBtwInputsFields),
            TextFormField(
              initialValue:
                  '123, Yopougon Maroc', // Remplacez par la valeur de l'emplacement actuel
              decoration: InputDecoration(
                labelText: 'Emplacement géographique',
              ),
            ),
            SizedBox(height: TSizes.spaceBtwSections),
            ElevatedButton(
              onPressed: () {
                // Ajoutez ici la logique pour la modification de l'adresse
                Navigator.pop(context); // Ferme la boîte de dialogue modale
              },
              child: Text('Modifier l\'Adresse'),
            ),
          ],
        ),
      );
    },
  );
}

void _showDeleteConfirmation(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Supprimer l\'adresse'),
        content: Text('Êtes-vous sûr de vouloir supprimer cette adresse ?'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              // Ajoutez ici la logique pour la suppression de l'adresse
              Navigator.of(context).pop();
            },
            child: Text('Oui'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Non'),
          ),
        ],
      );
    },
  );
}
