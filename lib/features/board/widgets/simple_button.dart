// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class SimpleButton extends StatelessWidget {
  const SimpleButton({
    Key? key,
    this.onPressed,
    required this.name,
    this.width = double.infinity,
  }) : super(key: key);
  final void Function()? onPressed;
  final String name;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 60,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xff006D94),

          // padding: EdgeInsets.symmetric(horizontal: 30),
          // minimumSize: const Size(150, 60),
        ),
        child: Text(
          name,
          style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.w800,
              fontFamily: "Cairo"
              // overflow: TextOverflow.clip,
              ),
        ),
      ),
    );
  }
}
