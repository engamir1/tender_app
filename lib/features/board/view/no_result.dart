import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants/text.dart';
import '../../../themes/text_style.dart';

class NoResultView extends StatelessWidget {
  const NoResultView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          AppText.searchResult,
          style: AppTextStyle.tabsText,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              AppText.noResult,
              style: AppTextStyle.titleStyle,
            ),
            const SizedBox(height: 40),
            SvgPicture.asset("assets/images/result.svg",
                width: 250, height: 300, semanticsLabel: 'No Result'),
          ],
        ),
      ),
    );
  }
}
