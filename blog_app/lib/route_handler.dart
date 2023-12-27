import 'dart:developer';

import 'package:blog_app/core/constants/screen_const.dart';
import 'package:blog_app/modules/auth/presentations/screens/auth_screen.dart';
import 'package:blog_app/modules/blogs/presentation/screens/blog_detail_screen.dart';
import 'package:blog_app/modules/blogs/presentation/screens/home_screen.dart';
import 'package:blog_app/splash_screen.dart';
import 'package:flutter/material.dart';

class RouteHandler {
  /// Triggers when the app is navigated to a named route.
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Receiving arguments that are passed in  while calling Navigator.pushNamed
    Object? args = settings.arguments;
    log("${args}hello");
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(
          builder: (BuildContext context) => const SplashScreen(
            duration: 3,
            navigateTo: ScreenConst.authScreen,
          ),
        );

      case ScreenConst.authScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => const AuthScreen(),
        );

      case ScreenConst.homeScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => const HomeScreen(),
        );

      case ScreenConst.blogDetailScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const BlogDetailScreen(),
            settings: RouteSettings(arguments: args));
      default:
        return errorRoute();
    }
  }

  /// Returns an error page.
  static Route<dynamic> errorRoute() {
    return MaterialPageRoute(
      builder: (_) => const Scaffold(
        body: Center(
          child: Text('Error Route'),
        ),
      ),
    );
  }
}
