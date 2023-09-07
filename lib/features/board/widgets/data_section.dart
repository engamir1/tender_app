// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:tender_app_test/themes/text_style.dart';

import '../../../themes/theme.dart';

class DataSection extends StatelessWidget {
  const DataSection({
    Key? key,
    required this.title,
    required this.value,
    this.color = AppColorPallete.blackColor,
    this.style = AppTextStyle.bigLightTitle,
  }) : super(key: key);
  final String title;
  final String value;
  final Color color;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          value,
          style: style,
          maxLines: 1,
          textDirection: TextDirection.rtl,
        ),
        const SizedBox(width: 5),
        const Text(":"),
        Text(title,
            overflow: TextOverflow.ellipsis,
            maxLines: 5,
            // softWrap: true,
            textDirection: TextDirection.rtl,
            style: AppTextStyle.blackText),
      ],
    );
  }
}
