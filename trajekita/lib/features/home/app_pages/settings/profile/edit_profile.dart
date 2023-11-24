import 'package:flutter/material.dart';
import 'package:trajekita/utils/constants/colors.dart';
import 'package:trajekita/utils/constants/sizes.dart';

class EditProfileScreen extends StatelessWidget {
  final String title;
  final String subTitle;
  final String initialValue;

  const EditProfileScreen({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.initialValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                subTitle,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 20),
              TextFormField(
                initialValue: initialValue,
                // Ajoutez des décorations, des gestionnaires d'état, etc. en fonction de vos besoins
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text("Continuer",
                      style: TextStyle(color: TColors.textWhite)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
