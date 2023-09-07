import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tender_app_test/cubit/tender_cubit.dart';

import '../widgets/app_bar_widget.dart';
import '../widgets/tender_card.dart';
import 'main_empty_search.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    TenderCubit cubit = BlocProvider.of<TenderCubit>(context);
    cubit.searchInLocalList(cubit.controller.text);

    return Scaffold(
      body: BlocConsumer<TenderCubit, TenderState>(
        listener: (context, state) {},
        builder: (context, state) {
          return cubit.searchTenderList.isNotEmpty
              ? Scaffold(
                  appBar: myAppBAr,
                  body: TenderCard(
                    cardText: " نتيجة البحث",
                    cubit: cubit,
                    inputList: cubit.searchTenderList,
                  ),
                )
              : const EmptySearchView();
        },
      ),
    );
  }
}
