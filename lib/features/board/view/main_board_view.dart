// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tender_app_test/features/board/view/all_tender.dart';
import 'package:tender_app_test/features/board/widgets/custom_list_tile.dart';

import '../../../constants/const.dart';
import '../../../cubit/tender_cubit.dart';
import '../../../themes/text_style.dart';
import '../../../themes/theme.dart';
import '../widgets/search_field.dart';
import '../widgets/simple_button.dart';
import 'specific_view.dart';

class TenderAppMain extends StatefulWidget {
  const TenderAppMain({super.key});

  @override
  State<TenderAppMain> createState() => _TenderAppMainState();
}

class _TenderAppMainState extends State<TenderAppMain>
    with TickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(
      length: 3,
      initialIndex: 2,
      vsync: this,
      animationDuration: const Duration(milliseconds: 100),
    );
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  // build drawer at first
  List<DrawerItem> drawerItems = [
    DrawerItem(
      title: AppText.search,
      icon: Icons.search,
    ),
    DrawerItem(
      title: AppText.special,
      icon: Icons.layers,
    ),
    DrawerItem(
      title: AppText.all,
      icon: Icons.home,
    ),
    DrawerItem(
      title: AppText.favorite,
      icon: Icons.favorite,
    ),
    DrawerItem(
      title: AppText.settings,
      icon: Icons.settings,
    ),
    DrawerItem(
      title: AppText.aboutApp,
      icon: Icons.smartphone,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    // start cubit at initialstate and make connection with cubit
    TenderCubit cubit = BlocProvider.of<TenderCubit>(context);
    // cubit.checkInternet();
    // get data from internet when start app
    cubit.getDataFromApi(AppText.allTenders);

    return DefaultTabController(
      length: 3,
      child: BlocBuilder<TenderCubit, TenderState>(
        builder: (context, state) {
          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              bottom: TabBar(
                controller: tabController,
                tabs: const [
                  // search tab
                  Text(
                    AppText.search,
                    style: AppTextStyle.tabsText,
                  ),
                  Text(
                    AppText.specific,
                    style: AppTextStyle.tabsText,
                  ),
                  Text(
                    AppText.all,
                    style: AppTextStyle.tabsText,
                  ),
                  // Tab(icon: Icon(Icons.directions_car)),
                  // Tab(icon: Icon(Icons.directions_transit)),
                  // Tab(icon: Icon(Icons.directions_bike)),
                ],
              ),
              elevation: 1,
              // Sync latest Tender button
              leading: IconButton(
                onPressed: () async {
                  tabController.animateTo(2);
                  await cubit.clearTendersAndGetLatest();
                },
                icon: const Icon(
                  Icons.sync,
                  color: AppColorPallete.darkBlue,
                  size: 30,
                ),
              ),
              actions: [
                // settings page
                IconButton(
                  onPressed: () {
                    // to show in drawer
                    cubit.fetchAllFavTenderFromHive();
                    scaffoldKey.currentState?.openEndDrawer();
                    // Navigator.of(context).pushNamed(RouteGenerator.favTenderView);
                  },
                  icon: const Icon(
                    Icons.tune,
                    color: AppColorPallete.darkBlue,
                    size: 30,
                  ),
                ),
              ],
              centerTitle: true,
              // title of app
              title: const Text(
                AppText.appTitle,
                style: AppTextStyle.tabsText,
              ),
            ),
            endDrawer: Directionality(
              textDirection: TextDirection.rtl,
              child: Drawer(
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 150.0,
                      child: DrawerHeader(
                        padding: EdgeInsets.zero,
                        child: Container(
                          color: AppColorPallete.whiteGreyColor,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  AppText.appTitle,
                                  style: AppTextStyle.splashTitleStyle,
                                ),
                                Text(
                                  " عدد العمليات حاليا  ${cubit.hiveTenderList.length}  عملية",
                                  style: AppTextStyle.blackText,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return CustomListTile(
                            index: index,
                            drawerItems: drawerItems,
                            cubit: cubit,
                            scaffoldKey: scaffoldKey,
                            tabController: tabController,
                          );
                        },
                        separatorBuilder: (context, index) => const MyDivider(),
                        itemCount: drawerItems.length,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            body: TabBarView(
              controller: tabController,
              children: [
                // search tab
                SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      children: [
                        const SizedBox(height: 50),
                        Form(
                          key: cubit.formKey,
                          autovalidateMode: cubit.autovalidateMode,
                          child: CustomInputField(
                            // onChanged: (value) {
                            //   cubit.controller.text = value;
                            // },

                            onSaved: (value) {
                              cubit.controller.text = value!;
                              // Close the keyboard after submit.
                              FocusScope.of(context).unfocus();
                            },
                            hintText: AppText.search,
                            iconData: Icons.search,
                            controller: cubit.controller,
                            onTapIcon: () {
                              cubit.search(context);
                            },
                          ),
                        ),
                        const SizedBox(height: 30),

                        // the button
                        SimpleButton(
                          name: AppText.search,
                          onPressed: () {
                            cubit.search(context);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                // specific page
                const SpecificView(),
                // all tender_app_test
                const AllTendersView(),
              ],
            ),
          );
        },
      ),
    );
  }
}

class DrawerItem {
  final String title;
  final IconData icon;

  DrawerItem({
    required this.title,
    required this.icon,
  });
}

class MyDivider extends StatelessWidget {
  const MyDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 1.0,
      color: AppColorPallete.darkBlue,
    );
  }
}
