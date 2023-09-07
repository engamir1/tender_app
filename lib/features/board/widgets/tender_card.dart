// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tender_app_test/features/board/widgets/title_label.dart';

import '../../../cubit/tender_cubit.dart';
import '../../../models/tender_model.dart';
import '../../../themes/color_pallete.dart';
import '../../../themes/text_style.dart';
import '../view/detail_page.dart';
import 'data_section.dart';
import 'fav_icon.dart';
import 'time_left.dart';

class TenderCard extends StatefulWidget {
  const TenderCard({
    Key? key,
    required this.cubit,
    required this.inputList,
    this.cardText = "جميع العمليات المتاحة ",
  }) : super(key: key);

  final TenderCubit cubit;
  final List<TenderModel> inputList;
  final String cardText;

  @override
  State<TenderCard> createState() => _TenderCardState();
}

class _TenderCardState extends State<TenderCard> {
  final ScrollController _scrollController = ScrollController();

  final bool isRefreshing = false;

  @override
  Widget build(BuildContext context) {
    TenderCubit cubit = BlocProvider.of<TenderCubit>(context);

    return RefreshIndicator(
      onRefresh: () async {
        await cubit.clearTendersAndGetLatest();
      },
      child: Scaffold(
        body: Column(
          children: [
            // data for tenders available
            Text(
              " ${widget.inputList.length} - ${widget.cardText}",
              textAlign: TextAlign.right,
              style: AppTextStyle.titleStyle,
            ),
            // tender list
            Expanded(
              child: ListView.builder(
                  controller: _scrollController,
                  physics: const BouncingScrollPhysics(),
                  itemCount: widget.inputList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, bottom: 10),
                      child: GestureDetector(
                        onTap: () {
                          widget.cubit.clickedIndex = index;
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return DetailsPage(inputList: widget.inputList);
                          }));
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
                                    LabelTitle(tender: widget.inputList[index]),
                                    Text(
                                      " ${widget.inputList[index].announcement_date} :تاريخ النشر ",
                                      style: AppTextStyle.lightTitle,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                // title of tender
                                Text(" ${widget.inputList[index].tender_title}",
                                    textAlign: TextAlign.right,
                                    style: AppTextStyle.boldBlackTitle),
                                const SizedBox(height: 5),
                                // title of organization
                                Text(" ${widget.inputList[index].entity}",
                                    textAlign: TextAlign.right,
                                    textDirection: TextDirection.rtl,
                                    style: AppTextStyle.bigLightTitle),
                                // DataSection(
                                //     title: "الجهة",
                                //     value: inputList[index].entity),
                                const Divider(
                                    thickness: 1, endIndent: 0, indent: 0),
                                const SizedBox(height: 5),
                                // time left
                                TimeLeft(tender: widget.inputList[index]),
                                const Divider(
                                    thickness: 1, endIndent: 0, indent: 0),
                                // insurance value
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    // share button
                                    CustomIconWidget(
                                      cubit: widget.cubit,
                                      index: index,
                                      icon: const Icon(
                                        Icons.share,
                                        color: AppColorPallete.darkBlue,
                                        size: 30,
                                      ),
                                      onPressed: () async {
                                        // final result = await Share.shareWithResult(
                                        //     'check out my website https://example.com');

                                        // if (result.status ==
                                        //     ShareResultStatus.success) {
                                        //   print(
                                        //       'Thank you for sharing my website!');
                                        // }
                                        // Share.share("new tender ",
                                        //     subject: 'Look what I made!');
                                      },
                                    ),
                                    // favorite button
                                    CustomIconWidget(
                                      cubit: widget.cubit,
                                      index: index,
                                      icon: Icon(
                                        !widget.inputList[index].isFav
                                            ? Icons.favorite_border
                                            : Icons.favorite,
                                        color: AppColorPallete.redColor,
                                        size: 30,
                                      ),
                                      onPressed: () async {
                                        await widget.cubit.changeFavoriteState(
                                            widget.inputList[index]);
                                      },
                                    ),
                                    const Spacer(),
                                    DataSection(
                                      title: "قيمة التأمين",
                                      value:
                                          " ${widget.inputList[index].insurance} جنيه " ??
                                              "لا يوجد",
                                      style: AppTextStyle.bigGreenLabelText,
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
      ),
    );
  }
}
