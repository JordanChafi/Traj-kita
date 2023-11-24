import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:trajekita/utils/constants/sizes.dart';

class TProfilMenu extends StatelessWidget {
  const TProfilMenu({
    super.key,
    required this.onPressed,
    required this.title,
    required this.value,
    this.icon = Iconsax.arrow_right_34,
  });

  final IconData icon;
  final VoidCallback onPressed;
  final String title, value;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
          padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwItems),
          child: Row(
            children: [
              Expanded(
                  flex: 4,
                  child: Text(title,
                      style: Theme.of(context).textTheme.bodySmall,
                      overflow: TextOverflow.ellipsis)),
              Expanded(
                  flex: 4,
                  child: Text(value,
                      style: Theme.of(context).textTheme.bodySmall,
                      overflow: TextOverflow.ellipsis)),
              Expanded(
                  child: Icon(
                Iconsax.arrow_right_34,
                size: 18,
              )),
            ],
          )),
    );
  }
}
