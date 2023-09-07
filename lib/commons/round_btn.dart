import 'package:flutter/material.dart';

class RoundedSmallBtn extends StatelessWidget {
  const RoundedSmallBtn(
      {super.key,
      required this.ontap,
      required this.label,
      required this.color,
      required this.textcolor});

  final VoidCallback ontap;
  final String label;
  final Color color;
  final Color textcolor;

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        label,
        style: TextStyle(
            color: textcolor,
            fontSize: 16,
            fontWeight: FontWeight.w800,
            fontFamily: "Cairo"),
      ),
      labelPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      backgroundColor: color,
    );
  }
}
