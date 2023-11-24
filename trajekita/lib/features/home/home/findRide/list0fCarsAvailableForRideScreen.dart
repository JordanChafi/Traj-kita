import 'package:flutter/material.dart';
import 'package:trajekita/utils/constants/colors.dart';
import 'package:trajekita/utils/constants/sizes.dart';

class AvailableVehiclesPage extends StatelessWidget {
  final List<VehicleCard> vehicles = [
    VehicleCard(
      driverName: 'Jack Doe',
      vehicleModel: 'Toyota Camry',
      plateNumber: 'ABC123',
      price: '1500F',
      startLocation: 'Lieu de départ 1',
      endLocation: 'Lieu d\'arrivée 1',
    ),
    VehicleCard(
      driverName: 'Emma Doe',
      vehicleModel: 'Honda Accord',
      plateNumber: 'XYZ789',
      price: '2000F',
      startLocation: 'Lieu de départ 2',
      endLocation: 'Lieu d\'arrivée 2',
    ),
    VehicleCard(
      driverName: 'Bennett Doe',
      vehicleModel: 'Tesla Model 3',
      plateNumber: 'DEF456',
      price: '3000F',
      startLocation: 'Lieu de départ 3',
      endLocation: 'Lieu d\'arrivée 3',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Conducteurs disponibles'),
        leading: BackButton(),
        backgroundColor: Colors.transparent,
        foregroundColor: TColors.black,
        elevation: 0,
        centerTitle: false,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
        children: [
          Text(
            '${vehicles.length} Conducteurs disponibles',
            style: TextStyle(color: TColors.darkGrey),
          ),
          const SizedBox(height: TSizes.spaceBtwItems),
          ...vehicles,
        ],
      ),
    );
  }
}

class VehicleCard extends StatelessWidget {
  final String driverName;
  final String vehicleModel;
  final String plateNumber;
  final String price;
  final String startLocation;
  final String endLocation;
  final double iconSize = 15.0;

  const VehicleCard({
    Key? key,
    required this.driverName,
    required this.vehicleModel,
    required this.plateNumber,
    required this.price,
    required this.startLocation,
    required this.endLocation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromARGB(255, 255, 255, 255),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: TColors.primary, width: 1.0),
        borderRadius: BorderRadius.circular(8.0),
      ),
      margin: EdgeInsets.only(bottom: 16.0),
      child: ListTile(
        contentPadding: EdgeInsets.all(16.0),
        title: Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            driverName,
            style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black),
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '$vehicleModel | $plateNumber | ',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: price,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Row(
              children: [
                Icon(
                  Icons.location_on,
                  size: iconSize,
                  color: Colors.black,
                ),
                SizedBox(width: 5),
                Text('$startLocation - $endLocation',
                    style: TextStyle(color: Colors.black)),
              ],
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputsFields,
            ),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {},
                child: const Text(
                  "Commander",
                  style: TextStyle(color: TColors.primary),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
