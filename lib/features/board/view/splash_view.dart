import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants/text.dart';
import '../../../themes/color_pallete.dart';
import '../../../themes/text_style.dart';

class SplashView extends StatelessWidget {
  const SplashView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorPallete.amberColor,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                AppText.appTitle,
                style: AppTextStyle.splashTitleStyle,
              ),
              const SizedBox(height: 40),
              SvgPicture.asset("assets/images/construction.svg",
                  width: 50, height: 150, semanticsLabel: 'splash screen'),
            ],
          ),
        ),
      ),
    );
  }
}
