// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:weather_application/main_card.dart';

class WeatherScreen extends StatelessWidget {
  // void Function()? onPressed;
  WeatherScreen({
    super.key,
    // required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Weather App",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                
                },
                icon: const Icon(Icons.refresh))
          ],
        ),
        body:const Padding(
          padding:  EdgeInsets.all(16.0),
          child:  Column(
            children: [
                MainCard(),
            ]
           
          ),
        ),
      ),
    );
  }
}
