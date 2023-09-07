import 'package:flutter/material.dart';

import '../../../constants/text.dart';
import '../../../themes/text_style.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(AppText.searchResult, style: AppTextStyle.tabsText),
      ),
      body: const Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          Text(AppText.stillSearching),
        ],
      )),
    );
  }
}
