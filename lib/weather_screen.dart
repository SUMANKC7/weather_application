// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:weather_application/additional_information.dart';
import 'package:weather_application/main_card.dart';
import 'package:weather_application/scrollable_weather_forecast.dart';
import 'package:http/http.dart' as http;
import 'package:weather_application/secrets.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({
    super.key,
  });

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  Future getCurrentWeather() async {
    try {
      final res = await http.get(
        Uri.parse(
            "https://api.openweathermap.org/data/2.5/forecast?q=London,uk&APPID=$openWeatherAPIkey"),
      );
      final data = jsonDecode(res.body);
      if (data["cod"] != "200") {
        throw "An unexpected error occur";
      }
      return data;

      //  data["list"][0]["main"]["temp"];
    } catch (e) {
      // throw "Error occured check APi";
      throw e.toString();
    }
  }

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
            IconButton(onPressed: () {}, icon: const Icon(Icons.refresh))
          ],
        ),
        body: FutureBuilder(
          future: getCurrentWeather(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child:  CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            return const Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Main Card
                    MainCard(
                      temperature: "200K",
                    ),
                    SizedBox(
                      height: 17,
                    ),
                    //Weather forecast

                    Text(
                      "Weather Forecast",
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 17,
                    ),
                    //Scrollable Weather forecast
                    SizedBox(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            WeatherForecast(
                              time: "9:00",
                              icon: Icons.cloud,
                              temperature: "301.17",
                            ),
                            WeatherForecast(
                              time: "10:00",
                              icon: Icons.sunny,
                              temperature: "315.19",
                            ),
                            WeatherForecast(
                              time: "11:00",
                              icon: Icons.sunny,
                              temperature: "300.98",
                            ),
                            WeatherForecast(
                              time: "12:00",
                              icon: Icons.sunny_snowing,
                              temperature: "320.98",
                            ),
                            WeatherForecast(
                              time: "1:00",
                              icon: Icons.cloud,
                              temperature: "330.1",
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 17,
                    ),
                    Text(
                      "Additional Information",
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 17,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        MyAdditionalInformation(
                          icon: Icons.water_drop,
                          condition: "Humidity",
                          value: "94",
                        ),
                        MyAdditionalInformation(
                          icon: Icons.wind_power,
                          condition: "wind Speed",
                          value: "7.67",
                        ),
                        MyAdditionalInformation(
                          icon: Icons.umbrella_outlined,
                          condition: "Pressure",
                          value: "1006",
                        ),
                      ],
                    )
                  ]),
            );
          },
        ),
      ),
    );
  }
}
