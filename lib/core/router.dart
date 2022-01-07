import 'package:flutter/material.dart';
import 'package:mega_home/utils/constants/routes.dart';
import 'package:mega_home/views/auth/login_view.dart';
import 'package:mega_home/views/auth/register_view.dart';
import 'package:mega_home/views/payment/submit_credit_view.dart';
import 'package:mega_home/views/home/home_view.dart';
import 'package:mega_home/wrapper.dart';

class AppRouter {
  static final navigatorKey = GlobalKey<NavigatorState>();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case wrapperRoute:
        return MaterialPageRoute(builder: (_) => Wrapper());
      case loginRoute:
        return MaterialPageRoute(builder: (_) => LoginView());
      case register1Route:
        return MaterialPageRoute(builder: (_) => RegisterView());
      case register2Route:
        return MaterialPageRoute(builder: (_) => SubmitCredit());
      case homeRoute:
        return MaterialPageRoute(builder: (_) => HomeView());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
