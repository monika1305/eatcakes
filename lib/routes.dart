import 'package:eatcakes/view/screen/cart/cart_screen.dart';
import 'package:eatcakes/view/screen/complete_profile/complete_profile_screen.dart';
import 'package:eatcakes/view/screen/details/details_screen.dart';
import 'package:eatcakes/view/screen/forgot_password/forgot_password_screen.dart';
import 'package:eatcakes/view/screen/home/home_screen.dart';
import 'package:eatcakes/view/screen/home/homescreenMobile.dart';
import 'package:eatcakes/view/screen/login_success/login_success_screen.dart';
import 'package:eatcakes/view/screen/otp/otp_screen.dart';
import 'package:eatcakes/view/screen/profile/profile_screen.dart';
import 'package:eatcakes/view/screen/sign_in/sign_in_screen.dart';
import 'package:eatcakes/view/screen/sign_up/sign_up_screen.dart';
import 'package:eatcakes/view/screen/splashscreen/splash_screen.dart';
import 'package:flutter/widgets.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  OtpScreen.routeName: (context) => OtpScreen(),
  // HomeScreen.routeName: (context) => HomeScreen(),
  HomeScreenMobile.routeName: (context) => HomeScreenMobile(),
  DetailsScreen.routeName: (context) => DetailsScreen(),
  CartScreen.routeName: (context) => CartScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
};
