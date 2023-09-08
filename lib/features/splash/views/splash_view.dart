import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tender_app_test/routes.dart';

import '../../../constants/text.dart';
import '../../../themes/color_pallete.dart';
import '../../../themes/text_style.dart';

class SplashView extends StatefulWidget {
  const SplashView({
    super.key,
  });

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;
  _startDelay() {
    _timer = Timer(const Duration(seconds: 3), _goNext);
  }

  _goNext() {
    Navigator.pushReplacementNamed(context, RouteGenerator.tenderAppMain);
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorPallete.whiteColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 1),
            Column(
              children: [
                const Text(
                  AppText.appTitle,
                  style: AppTextStyle.splashTitleStyle,
                ),
                // const SizedBox(height: 40),
                SvgPicture.asset("assets/images/construction.svg",
                    width: 50, height: 150, semanticsLabel: 'splash screen'),
              ],
            ),
            const Text(
              AppText.madeBy,
              style: AppTextStyle.boldBlackTitle,
            ),
          ],
        ),
      ),
    );
  }
}
