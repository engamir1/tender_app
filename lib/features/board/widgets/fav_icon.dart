// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../cubit/tender_cubit.dart';
import '../../../themes/color_pallete.dart';

class CustomIconWidget extends StatelessWidget {
  const CustomIconWidget({
    Key? key,
    required this.index,
    required this.cubit,
    required this.icon,
    this.onPressed,
  }) : super(key: key);
  final int index;

  final TenderCubit cubit;
  final Widget icon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      color: AppColorPallete.lightGreen,
      child: IconButton(
        onPressed: onPressed,
        icon: icon,
      ),
    );
  }
}
