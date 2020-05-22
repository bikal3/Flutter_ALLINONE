import 'package:allinone/screens/login_screen.dart';
import 'package:allinone/services/pekop_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

void setupLocator() {
  GetIt.instance.registerLazySingleton(() => PekopService());
}

void main() {
  setupLocator();
  runApp(App());
}

class App extends StatelessWidget {
  Widget build(context) {
    return MaterialApp(
      title: 'Pekop',
      onGenerateRoute: routes,
    );
  }

  Route routes(RouteSettings settings) {
    if (settings.name == '/') {
      return MaterialPageRoute(builder: (context) {
        return LoginScreen();
      });
    }
    return null;
  }
}
