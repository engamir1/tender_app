import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tender_app_test/cubit/tender_cubit.dart';

import '../../../themes/color_pallete.dart';
import '../../../themes/text_style.dart';
import '../view/main_board_view.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    Key? key,
    required this.drawerItems,
    required this.cubit,
    required this.scaffoldKey,
    required this.tabController,
    required this.index,
  }) : super(key: key);

  final List<DrawerItem> drawerItems;
  final TenderCubit cubit;
  final GlobalKey<ScaffoldState> scaffoldKey;
  final TabController tabController;
  final int index;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TenderCubit, TenderState>(
      builder: (context, state) {
        return ListTile(
          onTap: () {
            cubit.drawerNavigation(
                index: index,
                scaffoldKey: scaffoldKey,
                tabController: tabController,
                context: context);
          },
          selected: true,
          leading: Icon(
            drawerItems[index].icon,
            color: AppColorPallete.darkBlue,
          ),
          title: Text(
            index != 3
                ? drawerItems[index].title
                : " ${drawerItems[index].title} - ${cubit.favFromHive.length} ",
            style: AppTextStyle.titleStyle,
          ),
        );
      },
    );
  }
}
