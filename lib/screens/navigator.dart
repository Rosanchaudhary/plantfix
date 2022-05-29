import 'package:flutter/material.dart';
import 'package:Plantfix/screens/camera.dart';
import 'home_screen.dart';

class NavigatorScreen extends StatefulWidget {
  const NavigatorScreen({Key? key}) : super(key: key);

  @override
  _NavigatorScreenState createState() => _NavigatorScreenState();
}

class _NavigatorScreenState extends State<NavigatorScreen> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: _navigatorKey,
      onGenerateRoute: (RouteSettings settings) {
        WidgetBuilder builder;
        switch (settings.name) {
          case '/':
            builder = (BuildContext context) => HomeScreen();
            break;
          // case '/hey':
          //   builder = (BuildContext context) => Hey();
          //   break;
          case '/camera':
            builder = (BuildContext context) => CameraScreen();
            break;
          default:
            throw Exception('Invalid route: ${settings.name}');
        }
        return MaterialPageRoute(
          builder: builder,
          settings: settings,
        );
      },
    );
  }
}
