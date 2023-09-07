import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tender_app_test/constants/text.dart';

import '../../../cubit/tender_cubit.dart';
import 'no_internet_connection.dart';

class RefetchTenderView extends StatelessWidget {
  const RefetchTenderView({super.key});

  @override
  Widget build(BuildContext context) {
    TenderCubit cubit = BlocProvider.of<TenderCubit>(context);
    cubit.checkInternet();
    return BlocConsumer<TenderCubit, TenderState>(
      listener: (context, state) {
        // if (state is OnlineConnectionState) {
        //   cubit.isOnline = true;
        // } else if (state is OfflineState) {
        //   cubit.isOnline = false;
        // }
      },
      builder: (context, state) {
        return cubit.isOnline
            ? const Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  Text(AppText.stillLoadingTender),
                ],
              )
            : const DisconnectedView();
      },
    );
  }
}
