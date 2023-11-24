import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trajekita/utils/constants/sizes.dart';

class TOtpForm extends StatelessWidget {
  const TOtpForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          // OTP fields
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildOtpField(),
              _buildOtpField(),
              _buildOtpField(),
              _buildOtpField(),
            ],
          ),
          const SizedBox(height: TSizes.spaceBtwSections),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Vérifier'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOtpField() {
    return Container(
      width: 50,
      child: TextFormField(
        maxLength: 1,
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.allow(RegExp(r'[1-9]')),
        ],
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          counterText: "",
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
