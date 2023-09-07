import 'package:flutter/material.dart';
import 'package:tender_app_test/themes/color_pallete.dart';

class AuthField extends StatelessWidget {
  const AuthField(
      {super.key, required this.controller, required this.hintText});
  final TextEditingController controller;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColorPallete.darkBlue),
        ),
        hintText: hintText,
        hintStyle: const TextStyle(fontSize: 14),
        contentPadding: const EdgeInsets.all(20),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: AppColorPallete.darkBlue,
            width: 3,
          ),
        ),
      ),
    );
  }
}
