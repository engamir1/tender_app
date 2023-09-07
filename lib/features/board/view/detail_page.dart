// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tender_app_test/models/tender_model.dart';

import '../../../constants/text.dart';
import '../../../cubit/tender_cubit.dart';
import '../../../themes/text_style.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({
    Key? key,
    required this.inputList,
  }) : super(key: key);
  final List  inputList;

  @override
  Widget build(BuildContext context) {
 
    TenderCubit cubit = BlocProvider.of<TenderCubit>(context);

    int index = cubit.clickedIndex;
    TenderModel tender = inputList[index];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          AppText.details,
          style: AppTextStyle.tabsText,
        ),
      ),
      body: Column(children: [
        Center(
          child: Container(
            child: Text(tender.tender_title),
          ),
        )
      ]),
    );
  }
}
