import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants/text.dart';
import '../../../themes/text_style.dart';

class DisconnectedView extends StatelessWidget {
  const DisconnectedView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   title: const Text(
      //     TextString.searchResult,
      //     style: AppTextStyle.tabsText,
      //   ),
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              AppText.noInternet,
              style: AppTextStyle.titleStyle,
            ),
            const SizedBox(height: 40),
            SvgPicture.asset("assets/images/disconnected.svg",
                width: 250, height: 300, semanticsLabel: 'No Internet'),
          ],
        ),
      ),
    );
  }
}
