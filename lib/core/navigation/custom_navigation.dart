import 'package:dsproject/features/screens/auth/login_page.dart';
import 'package:dsproject/features/screens/workList/workList_page.dart';
import 'package:flutter/material.dart';
import 'routes.dart';

BuildContext? get currentContext => CustomNavigator.navigatorState.currentContext;

abstract class CustomNavigator {
  static final GlobalKey<NavigatorState> navigatorState = GlobalKey<NavigatorState>();
  static final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

  static Route<dynamic> onCreateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.LOGIN_SCREEN:
        return MaterialPageRoute(builder: (_) => LoginPage());
      case Routes.WORKLIST_SCREEN:
        return MaterialPageRoute(builder: (_) => WorkListPage());
      default:
        return MaterialPageRoute(builder: (_) => LoginPage());
    }
  }

  static Future<Object?> push(
    String routeName, {
    arguments,
    bool replace = false,
    bool clean = false,
  }) {
    if (clean) {
      return navigatorState.currentState!.pushNamedAndRemoveUntil(routeName, (_) => false, arguments: arguments);
    } else if (replace) {
      return navigatorState.currentState!.pushReplacementNamed(routeName, arguments: arguments);
    } else {
      return navigatorState.currentState!.pushNamed(routeName, arguments: arguments);
    }
  }

  static void pop({dynamic result}) {
    if (navigatorState.currentState!.canPop()) {
      navigatorState.currentState!.pop(result);
    }
  }
}
