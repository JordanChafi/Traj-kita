import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:trajekita/features/home/widgets/drawer_menu.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isSidebarOpen = false;

  void toggleSidebar() {
    setState(() {
      isSidebarOpen = !isSidebarOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20, top: 50, right: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    const Icon(Iconsax.user),
                    Positioned(
                      left: 0,
                      child: IconButton(
                        icon: const Icon(Iconsax.menu),
                        onPressed: () {
                          toggleSidebar();
                        },
                      ),
                    ),
                  ],
                ),
                const Icon(Iconsax.clock),
              ],
            ),
            // Autres éléments ici
          ],
        ),
      ),
      endDrawer: isSidebarOpen ? const MySidebar() : null,
    );
  }
}
