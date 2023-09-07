import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants/text.dart';
import '../../../themes/text_style.dart';

class AboutAppView extends StatefulWidget {
  const AboutAppView({
    super.key,
  });

  @override
  State<AboutAppView> createState() => _AboutAppViewState();
}

class _AboutAppViewState extends State<AboutAppView> {
  bool switchValue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          AppText.aboutApp,
          style: AppTextStyle.tabsText,
        ),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        const Text(
          AppText.appTitle,
          style: AppTextStyle.titleStyle,
        ),
        const SizedBox(height: 40),
        SvgPicture.asset("assets/images/about_me.svg",
            width: 200, height: 200, semanticsLabel: 'settings'),
        const SizedBox(height: 50),
        const Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(
            AppText.richTextAboutApp,
            textAlign: TextAlign.right,
            style: AppTextStyle.titleStyle,
          ),
        ),
      ]),
    );
  }
}
