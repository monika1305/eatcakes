

import 'package:eatcakes/routes.dart';
import 'package:eatcakes/theme/theme_const.dart';
import 'package:eatcakes/theme/theme_manager.dart';
import 'package:eatcakes/view/screen/details/details_screen.dart';
import 'package:eatcakes/view/screen/home/homescreenMobile.dart';
import 'package:eatcakes/view/screen/sign_in/sign_in_screen.dart';
import 'package:eatcakes/view/screen/splashscreen/splash_screen.dart';
import 'package:eatcakes/viewmodel/cakeviewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create : (_) => CakeListViewModel(),
        ),
      ],
      child:  MyApp(),
    ),
  );
}
ThemeManger _themeManger = ThemeManger();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cake App',
      theme: AppTheme.lightTheme,
      initialRoute: SplashScreen.routeName,
      routes: routes,
      // initialRoute: initScreen == 0 || initScreen == null ? "/" : "/sign_in",
      // routes: {
      //   '/': (context) => SplashScreen(),
      //   '/sign_in': (context) => SignInScreen(),
      //   '/home': (context) => HomeScreenMobile(),
      //   '/details': (context) => DetailsScreen(),
      //
      // },

    );
  }
}
