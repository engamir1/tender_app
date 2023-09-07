// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:tender_app_test/themes/text_style.dart';

class CustomInputField extends StatelessWidget {
  const CustomInputField({
    Key? key,
    this.onSaved,
    this.onTap,
    this.controller,
    this.maxLength,
    this.helpText,
    this.onChanged,
    this.onTapIcon,
    required this.hintText,
    required this.iconData,
  }) : super(key: key);

  final void Function(String?)? onSaved;
  final void Function()? onTap;
  final TextEditingController? controller;
  final int? maxLength;
  final String? helpText;
  final void Function(String)? onChanged;
  final void Function()? onTapIcon;

  final String hintText;
  final IconData? iconData;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: TextAlign.right,
      textDirection: TextDirection.rtl,
      controller: controller,
      maxLength: maxLength,
      onSaved: onSaved,
      onTap: onTap,
      onChanged: onChanged,
      validator: (value) {
        if (value!.isEmpty) {
          return "برجاء ادخال قيمة صحيحة";
        }
        return null;
      },
      style: AppTextStyle.titleStyle,
      decoration: InputDecoration(
        hintTextDirection: TextDirection.rtl,
        prefixIcon: GestureDetector(onTap: onTapIcon, child: Icon(iconData)),

        helperText: helpText,
        // label: const Text("title"),
        hintText: hintText,
        errorStyle: const TextStyle(fontSize: 12, fontFamily: "Cairo"),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.blue),
            borderRadius: BorderRadius.circular(12)),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.blue),
          borderRadius: BorderRadius.circular(12),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.blue),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
