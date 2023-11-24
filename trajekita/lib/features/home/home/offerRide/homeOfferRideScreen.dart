import 'package:flutter/material.dart';
import 'package:trajekita/utils/constants/colors.dart';
import 'package:trajekita/utils/constants/sizes.dart';

class HomeOfferRideScreen extends StatefulWidget {
  @override
  _HomeOfferRideScreenState createState() => _HomeOfferRideScreenState();
}

class _HomeOfferRideScreenState extends State<HomeOfferRideScreen> {
  int availableSeats = 1;
  String carBrand = '';
  String carColor = '';
  String carPlate = '';
  String rideAmount = '';

  TextEditingController carBrandController = TextEditingController();
  TextEditingController carColorController = TextEditingController();
  TextEditingController carPlateController = TextEditingController();
  TextEditingController rideAmountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(10.0),
        child: AppBar(
          backgroundColor: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: TSizes.defaultSpace),
              Text(
                'Proposer un Trajet',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'Veuillez entrer votre lieu de départ et votre lieu d\'arrivée :',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Lieu de départ',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.location_on),
                ),
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Lieu d\'arrivée',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.my_location),
                ),
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Places disponibles',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          border: Border.all(color: TColors.primary),
                        ),
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          iconSize: 20.0,
                          icon: Icon(Icons.remove),
                          color: TColors.primary,
                          onPressed: () {
                            setState(() {
                              if (availableSeats > 1) {
                                availableSeats--;
                              }
                            });
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text('$availableSeats'),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          border: Border.all(color: TColors.primary),
                        ),
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          iconSize: 20.0,
                          icon: Icon(Icons.add),
                          color: TColors.primary,
                          onPressed: () {
                            setState(() {
                              availableSeats++;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: TSizes.spaceBtwSections),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Sélectionner un véhicule',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  Container(
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                      border: Border.all(color: TColors.primary),
                    ),
                    child: TextButton(
                      onPressed: () {
                        _showAddVehicleModal(context);
                      },
                      child: Text(
                        carBrand.isEmpty &&
                                carColor.isEmpty &&
                                carPlate.isEmpty &&
                                rideAmount.isEmpty
                            ? 'Ajouter'
                            : 'Modifier',
                        style:
                            TextStyle(fontSize: 14.0, color: TColors.primary),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              carBrand.isNotEmpty ||
                      carColor.isNotEmpty ||
                      carPlate.isNotEmpty ||
                      rideAmount.isNotEmpty
                  ? Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 10.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: TColors.primary),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //SizedBox(height: TSizes.defaultSpace),
                          Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child: RichText(
                              text: TextSpan(
                                text: 'Détails du véhicule',
                                style: TextStyle(
                                  color: TColors.black,
                                  fontSize: 18.0,
                                  //fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: TSizes.spaceBtwItems),
                          Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child: RichText(
                              text: TextSpan(
                                style: TextStyle(
                                  color: TColors.black,
                                  fontSize: 16.0,
                                ),
                                children: [
                                  TextSpan(
                                    text: 'Marque de la voiture : ',
                                  ),
                                  TextSpan(
                                    text: '$carBrand',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: TSizes.spaceBtwItems),
                          Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child: RichText(
                              text: TextSpan(
                                style: TextStyle(
                                  color: TColors.black,
                                  fontSize: 16.0,
                                ),
                                children: [
                                  TextSpan(text: 'Couleur de la voiture : '),
                                  TextSpan(
                                    text: '$carColor',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: TSizes.spaceBtwItems),
                          Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child: RichText(
                              text: TextSpan(
                                style: TextStyle(
                                  color: TColors.black,
                                  fontSize: 16.0,
                                ),
                                children: [
                                  TextSpan(
                                      text: 'Numéro d\'Immatriculation : '),
                                  TextSpan(
                                    text: '$carPlate',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: TSizes.spaceBtwItems),
                          Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child: RichText(
                              text: TextSpan(
                                style: TextStyle(
                                  color: TColors.black,
                                  fontSize: 16.0,
                                ),
                                children: [
                                  TextSpan(text: 'Montant du trajet : '),
                                  TextSpan(
                                    text: '$rideAmount' + " Fcfa",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : SizedBox(),
              const SizedBox(height: TSizes.spaceBtwSections),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Créer un trajet'),
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
            ],
          ),
        ),
      ),
    );
  }

  void _showAddVehicleModal(BuildContext context) {
    Text? brandText = carBrand != null ? Text(carBrand!) : null;
    Text? colorText = carColor != null ? Text(carColor!) : null;
    Text? plateText = carPlate != null ? Text(carPlate!) : null;
    Text? amountText = rideAmount != null ? Text(rideAmount!) : null;

    bool isEditing = carBrand.isNotEmpty ||
        carColor.isNotEmpty ||
        carPlate.isNotEmpty ||
        rideAmount.isNotEmpty;

    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return ListView(
          children: [
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      isEditing
                          ? 'Modifier le véhicule'
                          : 'Ajouter un véhicule',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: TSizes.spaceBtwInputsFields,
                    ),
                    Text('Entrer les informations sur le véhicule'),
                    SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),
                    TextFormField(
                      controller: carBrandController,
                      decoration: InputDecoration(labelText: 'Marque voiture'),
                    ),
                    SizedBox(
                      height: TSizes.spaceBtwInputsFields,
                    ),
                    TextFormField(
                      controller: carColorController,
                      decoration: InputDecoration(labelText: 'Couleur'),
                    ),
                    SizedBox(
                      height: TSizes.spaceBtwInputsFields,
                    ),
                    TextFormField(
                      controller: carPlateController,
                      decoration: InputDecoration(labelText: 'Immatriculation'),
                    ),
                    SizedBox(
                      height: TSizes.spaceBtwInputsFields,
                    ),
                    TextFormField(
                      controller: rideAmountController,
                      decoration:
                          InputDecoration(labelText: 'Montant du trajet'),
                    ),
                    SizedBox(
                      height: TSizes.spaceBtwInputsFields,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            'Annuler',
                            style: TextStyle(
                              color: TColors.error,
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            // Ajoutez ici la logique pour ajouter un véhicule
                            Navigator.of(context).pop();
                            setState(() {
                              // Mise à jour des variables dans la classe principale
                              carBrand = carBrandController.text;
                              carColor = carColorController.text;
                              carPlate = carPlateController.text;
                              rideAmount = rideAmountController.text;
                            });
                          },
                          child: Text(
                            isEditing ? 'Modifier' : 'Ajouter',
                            style: TextStyle(
                              color: TColors.primary,
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
