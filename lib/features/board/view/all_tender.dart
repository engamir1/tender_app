// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tender_app_test/cubit/tender_cubit.dart';

import '../widgets/tender_card.dart';
import 'refetch_tender.dart';

class AllTendersView extends StatelessWidget {
  const AllTendersView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TenderCubit cubit = BlocProvider.of<TenderCubit>(context);
    cubit.checkInternet();
    // print("the length of list is ${cubit.tenderList.length}");

    return BlocConsumer<TenderCubit, TenderState>(
      listener: (context, state) {},
      builder: (context, state) {
        // print(cubit.hiveTenderList);
        return cubit.hiveTenderList.isNotEmpty && cubit.isOnline
            ? TenderCard(
                cubit: cubit,
                inputList: cubit.hiveTenderList,
              )
            : const RefetchTenderView();

        //  Column(
        //     children: [
        //       const SizedBox(height: 66, child: RefetchTenderView()),
        //       Expanded(
        //         child: TenderCard(
        //           cubit: cubit,
        //           inputList: cubit.oldhiveTenderList,
        //         ),
        //       )
        //     ],
        //   );
      },
    );
  }
}
