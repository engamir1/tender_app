import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tender_app_test/cubit/tender_cubit.dart';
import 'package:tender_app_test/themes/color_pallete.dart';

import '../../../constants/text.dart';
import '../../../themes/text_style.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({
    super.key,
  });

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    TenderCubit cubit = BlocProvider.of<TenderCubit>(context);
    // bool switchValue = cubit.switchValue;
    return BlocBuilder<TenderCubit, TenderState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text(
              AppText.settings,
              style: AppTextStyle.tabsText,
            ),
          ),
          body: Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 40),
                  SvgPicture.asset("assets/images/settings.svg",
                      width: 200, height: 200, semanticsLabel: 'settings'),
                  const SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text(
                        AppText.darkMode,
                        style: AppTextStyle.tabsText,
                      ),
                      CupertinoSwitch(
                        // overrides the default green color of the track
                        activeColor: AppColorPallete.secondaryColor,
                        // color of the round icon, which moves from right to left
                        thumbColor: AppColorPallete.greyColor,
                        // when the switch is off
                        trackColor: Colors.black12,
                        // boolean variable value
                        value: cubit.switchValue,
                        // changes the state of the switch
                        onChanged: (val) {
                          cubit.changeSwitchValue(val);
                        },
                      ),
                    ],
                  ),
                ]),
          ),
        );
      },
    );
  }
}
