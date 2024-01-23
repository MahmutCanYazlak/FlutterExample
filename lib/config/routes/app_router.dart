import 'package:flutter/material.dart';
import 'package:flutter_firs_project/config/routes/route_names.dart';
import 'package:flutter_firs_project/features/auth/view/login.dart';
import 'package:flutter_firs_project/features/auth/view/sign_in.dart';
import 'package:flutter_firs_project/features/home/view/home.dart';

import '../../features/auth/view/sign_up.dart';

class AppRouter {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.home:
        return _materialRoute(
          const Home(),
        );
      case RouteNames.login:
        return _materialRoute(
          const Login(),
        );

      case RouteNames.signIn:
        return _materialRoute(
          const SignIn(),
        );
      case RouteNames.signUp:
        return _materialRoute(
          const SignUp(),
        );

      default:
        return _materialRoute(
          const Login(),
        );
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
