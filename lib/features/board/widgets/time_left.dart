// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tender_app_test/cubit/tender_cubit.dart';
import 'package:tender_app_test/themes/text_style.dart';

import '../../../models/tender_model.dart';

class TimeLeft extends StatelessWidget {
  const TimeLeft({
    Key? key,
    required this.tender,
  }) : super(key: key);

  final TenderModel tender;

  @override
  Widget build(BuildContext context) {
    TenderCubit cubit = BlocProvider.of<TenderCubit>(context);
    cubit.checkTimeLeft(tender);

    return BlocConsumer<TenderCubit, TenderState>(
      listener: (context, state) {},
      builder: (context, state) {
        // cubit.checkTimeLeft(tender);

        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // Flexible(
            //   child: Text(
            //     "${cubit.seconds} ث ",
            //     textDirection: TextDirection.rtl,
            //     textAlign: TextAlign.right,
            //     style: const TextStyle(
            //       fontSize: 14,
            //       color: Colors.black,
            //       fontWeight: FontWeight.w600,
            //     ),
            //   ),
            // ),
            Flexible(
              child: Text(
                "${cubit.minutes} دقيقة ",
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.right,
                style: AppTextStyle.blackText,
              ),
            ),
            Flexible(
              child: Text(
                "${cubit.hours} ساعة ",
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.right,
                style: AppTextStyle.blackText,
              ),
            ),
            Flexible(
              child: Text(
                "${cubit.days} أيام ",
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.right,
                style: AppTextStyle.blackText,
              ),
            ),
            const Text(
              " : الوقت المتبقى ",
              textAlign: TextAlign.right,
              style: AppTextStyle.blackText,
            ),
          ],
        );
      },
    );
  }
}
