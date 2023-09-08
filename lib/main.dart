import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tender_app_test/constants/text.dart';
import 'package:tender_app_test/cubit/tender_cubit.dart';
import 'package:tender_app_test/models/favtender_model.dart';
import 'package:tender_app_test/routes.dart';

import 'features/board/view/main_board_view.dart';
 import 'models/tender_model.dart';
import 'my_observer.dart';
import 'themes/theme.dart';

void main() async {
// to make sure that every plugin if want to get any system features like camera or connect to gps ....
// A platform channel in Flutter is a mechanism for communicating between Flutter and the
// underlying platform (Android or iOS). It allows Flutter apps to access platform-specific
//features that are not available through Flutter's core APIs

  WidgetsFlutterBinding.ensureInitialized();
  // prevent rotate mobile
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  // observe cubit states when changed
  Bloc.observer = MyBlocObserver();
  // init Hive for flutter
  await Hive.initFlutter();
  // register Tender object for Hive
  Hive.registerAdapter(TenderModelAdapter());
  // wait open new box named "tender_app_test" to store data
  await Hive.openBox<TenderModel>(AppText.tender_app_test);
  
  // favorite box
  Hive.registerAdapter(FavTenderModelAdapter());

  await Hive.openBox<FavTenderModel>(AppText.favTenders);

  // run app
  runApp(
    const TenderApp(),
  );
}

class TenderApp extends StatelessWidget {
  const TenderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TenderCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.theme,
        initialRoute: RouteGenerator.splashView,
        onGenerateRoute: RouteGenerator.generateRoute,
        home: const TenderAppMain(),
        // themeMode: ThemeMode.light,
      ),
    );
  }
}
