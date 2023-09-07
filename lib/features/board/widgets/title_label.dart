// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:tender_app_test/themes/text_style.dart';

import '../../../models/tender_model.dart';
import '../../../themes/color_pallete.dart';

class LabelTitle extends StatelessWidget {
  const LabelTitle({
    Key? key,
    required this.tender,
  }) : super(key: key);
  final TenderModel tender;
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        color: AppColorPallete.lightGreen,
        child: Text(
          tender.activity,
          style: AppTextStyle.greenLabelText,
          softWrap: false,
        ),
      ),
    );
  }
}
