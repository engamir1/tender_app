import 'package:flutter/material.dart';
import 'package:tender_app_test/features/auth/view/login.dart';
import 'package:tender_app_test/features/auth/view/signup.dart';
import 'package:tender_app_test/features/board/view/about_page.dart';
import 'package:tender_app_test/features/board/view/all_tender.dart';
import 'package:tender_app_test/features/board/view/grouped_tenders.dart';
import 'package:tender_app_test/features/board/view/search_view.dart';
// import 'features/board/view/detail_page.dart';
import 'features/board/view/favorite_page.dart';
import 'features/board/view/main_board_view.dart';

class RouteGenerator {
  static const String boardView = "/board";
  static const String loginView = "/login";
  static const String signupView = "/signUp";
  static const String favTenderView = "/favTenders";
  // static const String testView = "/testView";
  static const String searchView = "/searchView";
  static const String detailView = "/detailView";
  static const String allTenderView = "/allTenderView";
  static const String tenderAppMain = "/tenderAppMain";
  static const String groupedTenders = "/groupedTenders";
  static const String aboutApp = "/aboutApp";
  static const String favoriteView = "/favoriteView";

  RouteGenerator._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case loginView:
        return MaterialPageRoute(builder: (_) {
          return const LoginView();
        });
      case signupView:
        return MaterialPageRoute(builder: (_) {
          return const SignupView();
        });
      case favoriteView:
        return MaterialPageRoute(builder: (_) {
          return const FavoriteView();
        });
      case tenderAppMain:
        return MaterialPageRoute(builder: (_) {
          return const TenderAppMain();
        });
      case searchView:
        return MaterialPageRoute(builder: (_) {
          return const SearchView();
        });
      // case detailView:
      //   return MaterialPageRoute(builder: (_) {
      //     return const DetailsPage();
      //   });
      case allTenderView:
        return MaterialPageRoute(builder: (_) {
          return const AllTendersView();
        });
      case groupedTenders:
        return MaterialPageRoute(builder: (_) {
          return const GroupedTenderView();
        });
      case aboutApp:
        return MaterialPageRoute(builder: (_) {
          return const AboutAppView();
        });

      default:
        throw const FormatException("Route not found");
    }
  }
}
