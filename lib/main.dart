import 'package:flutter/material.dart';
import 'package:weather_application/login/login_page.dart';

import 'package:weather_application/register/register_page.dart';
import 'package:weather_application/utils/routes.dart';
import 'package:weather_application/weather_screen.dart';
// import 'package:weather_application/weather_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: "Weather App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(useMaterial3: true),
      home: const RegisterPage(),
      initialRoute: MyRoutes.loginRoute,
      routes: {
        MyRoutes.loginRoute:(context) => const LoginPage(),
        MyRoutes.registerRoute:(context)=>const RegisterPage(),
        MyRoutes.homePage:(context) =>const WeatherScreen(),
      },
    );
  }
}