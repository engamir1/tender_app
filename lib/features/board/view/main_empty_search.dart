import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubit/tender_cubit.dart';
import 'loading_view.dart';
import 'no_result.dart';

class EmptySearchView extends StatelessWidget {
  const EmptySearchView({super.key});

  @override
  Widget build(BuildContext context) {
    TenderCubit cubit = BlocProvider.of<TenderCubit>(context);
    return BlocConsumer<TenderCubit, TenderState>(
      listener: (context, state) {},
      builder: (context, state) {
        // print("the waiting value is ${cubit.waiting}");
        return cubit.waiting ? const LoadingView() : const NoResultView();
      },
    );
  }
}
