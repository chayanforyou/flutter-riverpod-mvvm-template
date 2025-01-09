import 'package:flutter/widgets.dart';
import 'package:flutter_assignment/data/models/github_project_response.dart';
import 'package:flutter_assignment/view/screens/home/home_screen.dart';
import 'package:flutter_assignment/view/screens/project_details/project_details_screen.dart';
import 'package:page_transition/page_transition.dart';

class Routes {
  Routes._();

  static const String home = '/';
  static const String details = '/project_details';
}

Route generatedRoutes(RouteSettings settings) {
  Widget child;

  switch (settings.name) {
    case Routes.home:
      child = const HomeScreen();
      break;
    case Routes.details:
      final data = settings.arguments as Repository;
      child = ProjectDetailsScreen(repo: data);
      break;
    default:
      throw Exception('Invalid route: ${settings.name}');
  }

  return PageTransition(
    child: child,
    settings: settings,
    type: PageTransitionType.fade,
    duration: const Duration(milliseconds: 200),
    reverseDuration: const Duration(milliseconds: 200),
  );
}
