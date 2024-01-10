import 'package:flutter/material.dart';
import 'package:trajekita/utils/constants/colors.dart';
import 'package:trajekita/utils/constants/sizes.dart';

class CancellationScreen extends StatefulWidget {
  @override
  _CancellationScreenState createState() => _CancellationScreenState();
}

class _CancellationScreenState extends State<CancellationScreen> {
  List<String> reasons = [
    'J\'attends depuis longtemps',
    'Impossible de contacter le chauffeur',
    'Le conducteur a refusé',
    'Mauvaise adresse affichée',
    'Le prix n\'est pas raisonnable',
    'Véhicule en mauvais état',
  ];
  List<bool> selectedReasons = List.filled(6, false);
  TextEditingController otherReasonController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColors.white,
        title: const Text('Annulation'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Annuler la réservation
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Text(
                  'Veuillez sélectionner le motif de l\'annulation.',
                  style: TextStyle(fontSize: 16, color: TColors.darkGrey),
                ),
              ),
              for (int i = 0; i < reasons.length; i++)
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: TColors.darkGrey),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: CheckboxListTile(
                        controlAffinity: ListTileControlAffinity
                            .leading, // Pour placer la case à cocher avant le texte
                        title: Text(
                          reasons[i],
                          style: TextStyle(color: TColors.black, fontSize: 15),
                        ),
                        value: selectedReasons[i],
                        onChanged: (value) {
                          setState(() {
                            selectedReasons[i] = value!;
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),
                  ],
                ),
              //SizedBox(height: 20),
              TextFormField(
                controller: otherReasonController,
                maxLines: null,
                minLines: 4,
                decoration: InputDecoration(
                  hintText: 'Autre Motif',
                  hintStyle: TextStyle(color: TColors.darkGrey),
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                ),
              ),
              SizedBox(height: 40),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    List<String> selected = [];
                    for (int i = 0; i < reasons.length; i++) {
                      if (selectedReasons[i]) {
                        selected.add(reasons[i]);
                      }
                    }
                    print('Selected Reasons: $selected');
                    print('Other Reason: ${otherReasonController.text}');
                  },
                  child: Text('Envoyer'),
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
            ],
          ),
        ),
      ),
    );
  }
}
