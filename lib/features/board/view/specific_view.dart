import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubit/tender_cubit.dart';

class SpecificView extends StatelessWidget {
  const SpecificView({super.key});

  @override
  Widget build(BuildContext context) {
    TenderCubit cubit = BlocProvider.of<TenderCubit>(context);

    List<Widget> myTiles = cubit.makeGroup(context);
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: <Widget>[
            const SizedBox(height: 20),

            // const Icon(Icons.directions_transit),
            ...myTiles,
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
