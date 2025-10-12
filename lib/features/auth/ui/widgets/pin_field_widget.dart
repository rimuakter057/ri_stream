import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinFieldWidget extends StatelessWidget {
  const PinFieldWidget({
    super.key,
    required this.controller,
    required this.length,
    this.onChanged,
    this.onCompleted,
  });

  final TextEditingController controller;
  final int length;
  final Function(String)? onChanged;
  final Function(String)? onCompleted;

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      controller: controller,
      length: length,
      obscureText: false,
      keyboardType: TextInputType.number,
      animationType: AnimationType.fade,
      animationDuration: const Duration(milliseconds: 200),
      enableActiveFill: true,

      // ✅ pin theme
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(12),
        fieldHeight: 52,
        fieldWidth: 52,
        activeFillColor: Colors.white,
        inactiveFillColor: Colors.white,
        selectedFillColor: Colors.white,
        activeColor: const Color(0xFFE4E4E4),
        inactiveColor: const Color(0xFFE4E4E4),
        selectedColor: const Color(0xFFE4E4E4),


      ),

      onChanged: onChanged,
      onCompleted: onCompleted,
    );
  }
}
