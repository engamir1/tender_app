import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tender_app_test/features/board/widgets/app_bar_widget.dart';
import 'package:tender_app_test/models/favtender_model.dart';
import 'package:tender_app_test/models/tender_model.dart';

import '../../../constants/text.dart';
import '../../../cubit/tender_cubit.dart';
import '../../../themes/text_style.dart';

import 'package:tender_app_test/features/board/widgets/title_label.dart';

import '../../../themes/color_pallete.dart';
import '../view/detail_page.dart';
import '../widgets/data_section.dart';
import '../widgets/fav_icon.dart';
import '../widgets/time_left.dart';

class FavoriteView extends StatefulWidget {
  const FavoriteView({
    super.key,
  });

  @override
  State<FavoriteView> createState() => _FavoriteViewState();
}

class _FavoriteViewState extends State<FavoriteView> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    TenderCubit cubit = BlocProvider.of<TenderCubit>(context);
    // cubit.fetchAllFavTenderFromHive();

    return BlocConsumer<TenderCubit, TenderState>(
      builder: (context, state) {
        List<FavTenderModel> tender_app_test = cubit.favFromHive;

        return false
            ? Scaffold(
                appBar: myAppBAr,
                body: Column(
                  children: [
                    // data for tender_app_test available
                    Text(
                      " ${tender_app_test.length} - نتيجة المفضلة",
                      textAlign: TextAlign.right,
                      style: AppTextStyle.titleStyle,
                    ),
                    // tender list
                    Expanded(
                      child: ListView.builder(
                          controller: _scrollController,
                          physics: const BouncingScrollPhysics(),
                          itemCount: tender_app_test.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10, bottom: 10),
                              child: GestureDetector(
                                onTap: () {
                                  cubit.clickedIndex = index;
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return DetailsPage(
                                        inputList: tender_app_test);
                                  }));

                                  // =============================
                                  // Navigator.of(context).pushNamed(
                                  //     RouteGenerator.detailView,
                                  //     arguments: inputList);
                                },
                                child: Card(
                                  elevation: 3,
                                  margin: const EdgeInsets.only(bottom: 20),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 20, top: 10),
                                    child: Column(
                                      children: [
                                        // publish data and titleLabel
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            // LabelTitle(tender: tender_app_test[index]),
                                            Text(
                                              " ${tender_app_test[index].announcement_date} :تاريخ النشر ",
                                              style: AppTextStyle.lightTitle,
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 10),
                                        // title of tender
                                        Text(
                                            " ${tender_app_test[index].tender_title}",
                                            textAlign: TextAlign.right,
                                            style: AppTextStyle.boldBlackTitle),
                                        const SizedBox(height: 5),
                                        // title of organization
                                        Text(
                                            " ${tender_app_test[index].entity}",
                                            textAlign: TextAlign.right,
                                            textDirection: TextDirection.rtl,
                                            style: AppTextStyle.bigLightTitle),
                                        // DataSection(
                                        //     title: "الجهة",
                                        //     value: inputList[index].entity),
                                        const Divider(
                                            thickness: 1,
                                            endIndent: 0,
                                            indent: 0),
                                        const SizedBox(height: 5),
                                        // time left
                                        // TimeLeft(tender: tender_app_test[index]),
                                        const Divider(
                                            thickness: 1,
                                            endIndent: 0,
                                            indent: 0),
                                        // insurance value
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            // share button
                                            CustomIconWidget(
                                              cubit: cubit,
                                              index: index,
                                              icon: const Icon(
                                                Icons.share,
                                                color: AppColorPallete.darkBlue,
                                                size: 30,
                                              ),
                                              onPressed: () {},
                                            ),
                                            // favorite button
                                            CustomIconWidget(
                                              cubit: cubit,
                                              index: index,
                                              icon: Icon(
                                                !tender_app_test[index].isFav
                                                    ? Icons.favorite_border
                                                    : Icons.favorite,
                                                color: AppColorPallete.redColor,
                                                size: 30,
                                              ),
                                              onPressed: () async {
                                                // await cubit
                                                //     .fetchAllFavTenderFromHive();
                                                // await cubit.changeFavoriteState(
                                                //     tender_app_test[index]);

                                                await cubit
                                                    .removeFavTenderFromHive(
                                                        index);
                                              },
                                            ),
                                            const Spacer(),
                                            DataSection(
                                              title: "قيمة التأمين",
                                              value:
                                                  " ${tender_app_test[index].insurance} جنيه " ??
                                                      "لا يوجد",
                                              style: AppTextStyle
                                                  .bigGreenLabelText,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              )
            : Scaffold(
                appBar: AppBar(
                  centerTitle: true,
                  title: const Text(
                    AppText.favorite,
                    style: AppTextStyle.tabsText,
                  ),
                ),
                body: Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          " لا يوجد عمليات مفضلة حتى الان",
                          style: AppTextStyle.titleStyle,
                        ),
                        const SizedBox(height: 40),
                        SvgPicture.asset("assets/images/empty.svg",
                            width: 200,
                            height: 200,
                            semanticsLabel: 'settings'),
                        const SizedBox(height: 50),
                      ]),
                ),
              );
      },
      listener: (context, state) {},
    );
  }
}
