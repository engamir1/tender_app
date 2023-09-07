import 'package:flutter/material.dart';

import '../../../constants/text.dart';
import '../../../themes/text_style.dart';

AppBar myAppBAr = AppBar(
  elevation: 1,

  // actions: [
  //   // settings page
  //   IconButton(
  //     onPressed: () {
  //       // Navigator.of(context).pushNamed(RouteGenerator.favTenderView);
  //     },
  //     icon: const Icon(
  //       Icons.tune,
  //       color: AppColorPallete.darkBlue,
  //       size: 30,
  //     ),
  //   ),
  // ],
  centerTitle: true,
  // title of app
  title: const Text(
    AppText.searchResult,
    style: AppTextStyle.tabsText,
  ),
);
