import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tender_app_test/cubit/tender_cubit.dart';
import 'package:tender_app_test/features/board/widgets/tender_card.dart';

import '../../../constants/text.dart';
import '../../../themes/text_style.dart';

class GroupedTenderView extends StatefulWidget {
  const GroupedTenderView({
    super.key,
  });

  @override
  State<GroupedTenderView> createState() => _GroupedTenderViewState();
}

class _GroupedTenderViewState extends State<GroupedTenderView> {
  bool switchValue = false;

  @override
  Widget build(BuildContext context) {
    TenderCubit cubit = BlocProvider.of<TenderCubit>(context);
    return BlocBuilder<TenderCubit, TenderState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text(
              AppText.specific,
              style: AppTextStyle.tabsText,
            ),
          ),
          body: Column(
            children: [
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  cubit.specialList[0].activity,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyle.boldBlackTitle,
                ),
              ),
              Expanded(
                child: TenderCard(cubit: cubit, inputList: cubit.specialList),
              ),
            ],
          ),
        );
      },
    );
  }
}
