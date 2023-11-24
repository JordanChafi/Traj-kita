import 'package:flutter/material.dart';
import 'package:trajekita/utils/constants/colors.dart';
import 'package:trajekita/utils/constants/image_strings.dart';
import 'package:trajekita/utils/constants/sizes.dart';

class PaymentMethodscreen extends StatefulWidget {
  const PaymentMethodscreen({super.key});

  @override
  State<PaymentMethodscreen> createState() => _PaymentMethodscreenState();
}

class _PaymentMethodscreenState extends State<PaymentMethodscreen> {
  int _type = 1;
  void _handleRadio(Object? e) => setState(() {
        _type = e as int;
      });

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Méthode de paiement'),
        leading: BackButton(),
        backgroundColor: Colors.transparent,
        foregroundColor: TColors.black,
        elevation: 0,
        centerTitle: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 300,
                  height: 55,
                  //margin: EdgeInsets.only(right: 20),
                  decoration: BoxDecoration(
                    border: _type == 1
                        ? Border.all(width: 0.8, color: TColors.primary)
                        : Border.all(width: 0.3, color: TColors.grey),
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.transparent,
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Radio(
                                value: 1,
                                groupValue: _type,
                                onChanged: _handleRadio,
                                activeColor: TColors.primary,
                              ),
                              Text(
                                "MTN MOMO",
                                style: _type == 1
                                    ? TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: TColors.primary)
                                    : TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: TColors.grey),
                              ),
                            ],
                          ),
                          Image.asset(
                            TImages.momoMtn,
                            width: 95,
                            height: 70,
                            fit: BoxFit.fill,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  width: 300,
                  height: 55,
                  //margin: EdgeInsets.only(right: 20),
                  decoration: BoxDecoration(
                    border: _type == 2
                        ? Border.all(width: 0.8, color: TColors.primary)
                        : Border.all(width: 0.3, color: TColors.grey),
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.transparent,
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Radio(
                                value: 2,
                                groupValue: _type,
                                onChanged: _handleRadio,
                                activeColor: TColors.primary,
                              ),
                              Text(
                                "DJAMO",
                                style: _type == 2
                                    ? TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: TColors.black)
                                    : TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: TColors.grey),
                              ),
                            ],
                          ),
                          Image.asset(
                            TImages.lightDjamo,
                            width: 50,
                            height: 30,
                            fit: BoxFit.fill,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  width: 300,
                  height: 55,
                  //margin: EdgeInsets.only(right: 20),
                  decoration: BoxDecoration(
                    border: _type == 3
                        ? Border.all(width: 0.8, color: TColors.primary)
                        : Border.all(width: 0.3, color: TColors.grey),
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.transparent,
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Radio(
                                value: 3,
                                groupValue: _type,
                                onChanged: _handleRadio,
                                activeColor: TColors.primary,
                              ),
                              Text(
                                "VISA",
                                style: _type == 3
                                    ? TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: TColors.primary)
                                    : TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: TColors.grey),
                              ),
                            ],
                          ),
                          Image.asset(
                            TImages.lightVisa,
                            width: 50,
                            height: 30,
                            fit: BoxFit.fill,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: TSizes.spaceBtwSections + 5),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Estimation financière",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: TColors.darkGrey),
                    ),
                    Text(
                      "1000" + " fcfa",
                      style: TextStyle(
                          color: TColors.primary,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text('Procéder au paiement'),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: TSizes.spaceBtwInputsFields),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
