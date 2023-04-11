import 'package:dashboard/screens/form_screen.dart';
import 'package:dashboard/screens/overview_screen.dart';
import 'package:dashboard/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dashboard App',
      theme: ThemeData.light(),
      home: SplashScreen(),
      routes: {
        SplashScreen.ROUTE: (context) => SplashScreen(),
        OverviewScreen.ROUTE: (context) => OverviewScreen(),
        FormScreen.ROUTE: (context) => FormScreen(),
      },
    );
  }
}
