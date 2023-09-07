import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:tender_app_test/constants/text.dart';
import 'package:tender_app_test/models/favtender_model.dart';
import 'package:tender_app_test/models/tender_model.dart';
import 'package:tender_app_test/themes/color_pallete.dart';
import 'package:tender_app_test/themes/text_style.dart';

import '../api/tender_api.dart';

import "package:collection/collection.dart";

import '../routes.dart';

part 'tender_state.dart';

class TenderCubit extends Cubit<TenderState> {
  TenderCubit() : super(TenderInitial());

  bool draweSatatus = false;
  void openAndCloseDrawer() {
    draweSatatus = !draweSatatus;
    emit(OpenDrawer());
  }

  void closeDrawer() {
    draweSatatus = !draweSatatus;
    emit(CloseDrawer());
  }

  // static TenderCubit get(context) => BlocProvider.of(context);

  // List<TenderModel> tenderList = [];
  List<TenderModel> searchTenderList = [];
  List<TenderModel> hiveTenderList = [];
  List<TenderModel> oldhiveTenderList = [];
  List<TenderModel> favHiveTenderList = [];
  List<TenderModel> specialList = [];
  List<FavTenderModel> favFromHive = [];

  // check connection
  bool isOnline = false;
  //  method to get internet status
  checkInternet() async {
    var isConnected = await InternetConnectionChecker().hasConnection;

    if (isConnected) {
      isOnline = true;
      emit(OnlineConnectionState());
    } else if (!isConnected) {
      // i should change state of isOnline
      isOnline = false;
      emit(OfflineState());
    }
    print("the connection is $isConnected");
  }

//  get Data from Api
  getDataFromApi(String val) async {
    // check internet at first
    await checkInternet();
    print("the line status is $isOnline");
    if (isOnline) {
      // val = "https://egypt-tender.de.r.appspot.com/irrigation";
      String url = "https://egypt-tender.de.r.appspot.com/$val";
      // String url = "https://egypt-tender.de.r.appspot.com/all_tenders";

      // String url = "http://10.0.2.2:5000/$val";

      RequestTender request = RequestTender(url: url);
      // check if list  is empty or not
      emit(LoadingTender());
      try {
        var getList = await request.execute();
        var box = Hive.box<TenderModel>(AppText.tenders);
        await box.clear();
        await box.addAll(getList);
        // tenderList = getList;
        hiveTenderList = box.values.toList();
        oldhiveTenderList = hiveTenderList;
        // makeGroup();
        emit(SuccessTender());
      } catch (e) {
        print("the error is $e");
        ErrorTender(err: e.toString());
        emit(ErrorTender(err: e.toString()));
      }
    } else {
      emit(OfflineState());
    }
  }

  List<Widget> makeGroup(BuildContext context) {
    var groupedTenders = groupBy(hiveTenderList, (tender) => tender.activity);
    // print("the group is $groupedTenders");

    for (var key in groupedTenders.keys) {
      // print('The activity is $key');
      for (var tender in groupedTenders[key]!) {
        // print("the tender is ${tender.tender_title}");
      }
    }
    Map<String, int> chips = {};

    for (var tender in hiveTenderList) {
      var activity = tender.activity;
      if (!chips.containsKey(activity)) {
        chips[activity] = 0;
      }

      chips.update(activity, (value) => value + 1);
    }

    List<Widget> tileWidgets = [];

    for (var key in chips.keys) {
      tileWidgets.add(ListTile(
        onTap: () {
          print(key.toString());
          print(chips.values.toString());
          specialGroupList(key.toString());
          Navigator.of(context).pushNamed(RouteGenerator.groupedTenders);
        },
        selected: true,
        // leading: const Icon(
        //   Icons.star,
        //   color: AppColorPallete.darkBlue,
        // ),
        title: Text(
          key.toString(),
          style: AppTextStyle.titleStyle,
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: AppColorPallete.darkBlue,
              child: Text(
                chips[key].toString(),
                style: AppTextStyle.whiteText,
              ),
            )
          ],
        ),
      ));
    }

    return tileWidgets;
  }

// fetch data from box
  // fetchAllTenderFromBox() {
  //   emit(LoadingTender());
  //   try {
  //     // var box = Hive.box<FavTenderModel>(AppText.favTenders);
  //     // favFromHive = box.values.toList();

  //     emit(SuccessTender());
  //   } catch (e) {
  //     emit(ErrorTender(err: e.toString()));
  //   }
  // }

  int? days;
  int? hours;
  int? minutes;
  int? seconds;

  checkTimeLeft(TenderModel tender) {
    DateTime now = DateTime.now();

    DateTime envelopesOpeningDate =
        DateTime.parse(tender.envelopes_opening_date);
    // print(envelopesOpeningDate);
    final difference = envelopesOpeningDate.difference(now);

    days = difference.inDays;
    hours = difference.inHours % 24;
    minutes = difference.inMinutes % 60;
    seconds = difference.inSeconds % 60;
    // if you want to rebuild screen every seconds
    // add cubit.checkTimeLeft() in build
    // emit(TimeTender());
  }

// clear list and re-fetch fata from net
  clearTendersAndGetLatest() async {
    favHiveTenderList = [];
    hiveTenderList = [];
    // favFromHive = [];

    await Hive.box<TenderModel>(AppText.tenders).clear();
    // await Hive.box<FavTenderModel>(AppText.favTenders).clear();

    await getDataFromApi(AppText.allTenders);
    emit(UpdatedTender());
  }

  int initialIndex = 2;
  int clickedIndex = 0;
  changeIndex() {
    initialIndex = 2;
    emit(ChangeINdex());
  }

  TextEditingController controller = TextEditingController();
// search section -----------------------------------
  bool waiting = true;

  // search in local list
  searchInLocalList(String q) {
    emit(LoadingSearchState());

    searchTenderList.clear();
    try {
      for (var element in hiveTenderList) {
        if (element.tender_title.contains(q)) {
          searchTenderList.add(element);
          // emit(SuccessSearchState());
        } else {
          // emit(FaildSearchState());
        }
      }

      if (searchTenderList.isEmpty) {
        waiting = false;
      } else {
        // print(" the list now is $searchTenderList");
        emit(SuccessSearchState());
      }
    } catch (e) {
      // print("the error is $e");
      emit(FaildSearchState());
    }
  }

// ----------------- form state ----------------
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

// favorite section
  changeFavoriteState(TenderModel tender) async {
    tender.isFav = !tender.isFav;
    emit(ChangeIsFavState());
  }

// get data from box that have isFav = true
  fetchAllFavTenderFromHive() async {
    // await Hive.box<FavTenderModel>(AppText.favTenders).clear();

    // emit(LoaddingFavState());
    var box = Hive.box<FavTenderModel>(AppText.favTenders);

    // favHiveTenderList = hiveTenderList.where((tender) => tender.isFav).toList();
    var list1 = hiveTenderList.where((tender) => tender.isFav).toList();
    // print(list1.length);
    for (var tender in list1) {
      if (!box.containsKey(tender.id)) {
        box.add(
          FavTenderModel(
              tender_title: tender.tender_title,
              entity: tender.entity,
              announcement_date: tender.announcement_date,
              envelopes_opening_date: tender.envelopes_opening_date,
              activity: tender.activity,
              isFav: tender.isFav,
              id: tender.id),
        );
      }
      // print(tender);
    }

    favFromHive = box.values.toList();
  }

  removeFavTenderFromHive(int index) async {
    var box = Hive.box<FavTenderModel>(AppText.favTenders);
    final keys = box.keys;
   

    print(index);
    print(box.keys);
    await box.delete(index);

    favFromHive = box.values.toList();
    // print(favFromHive);

    emit(ChangeIsFavState());
    // favFromHive.remove(favFromHive[index]);
    // fetchAllFavTenderFromHive();
    // emit(NotFavState());
  }

  // addToFavTenderFromHive(int index) {
  //   favHiveTenderList.remove(favHiveTenderList[index]);
  //   print(" after delete ${favHiveTenderList[index].tender_title}");
  //   emit(NotFavState());
  // }

//  navigation of drawer
  final int searchTab = 2;
  final int spcificTAb = 1;
  final int allTenderTab = 0;
  void drawerNavigation(
      {GlobalKey<ScaffoldState>? scaffoldKey,
      TabController? tabController,
      int? index,
      BuildContext? context}) {
    if (index == searchTab || index == spcificTAb || index == allTenderTab) {
      tabController?.animateTo(index!);
      scaffoldKey?.currentState?.closeEndDrawer();
    } else if (index == 3) {
      Navigator.of(context!).pushNamed(RouteGenerator.favoriteView);
      scaffoldKey?.currentState?.closeEndDrawer();
    } else if (index == 4) {
      Navigator.of(context!).pushNamed(RouteGenerator.groupedTenders);
      scaffoldKey?.currentState?.closeEndDrawer();
    } else if (index == 5) {
      Navigator.of(context!).pushNamed(RouteGenerator.aboutApp);
      scaffoldKey?.currentState?.closeEndDrawer();
    }
  }

// search button
  void search(BuildContext context) {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      Navigator.pushNamed(context, RouteGenerator.searchView);
      // cubit.controller.text = "";
    } else {
      autovalidateMode = AutovalidateMode.always;
    }
  }

  // show only grouped items
  void specialGroupList(String activity) {
    specialList =
        hiveTenderList.where((tender) => tender.activity == activity).toList();
  }
}
