// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:weather_application/main_card.dart';
import 'package:weather_application/scrollable_weather_forecast.dart';

class WeatherScreen extends StatelessWidget {
  // void Function()? onPressed;
  const WeatherScreen({
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
        body:const  Padding(
          padding:  EdgeInsets.all(16.0),
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Main Card
                MainCard(),
            SizedBox(height: 17,),
               //Weather forecast
               
                Text("Weather Forecast",style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
                ),
                SizedBox(height: 13,),
                //Scrollable Weather forecast
             SizedBox(
          
               child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                 child: Row(
                  children: [  
                    WeatherForecast(),
                    WeatherForecast(),
                   WeatherForecast(),
                   WeatherForecast(),
                   WeatherForecast(),
                   ],
                 ),
               ),
             )

            ]
           
          ),
        ),
      ),
    );
  }
}
