// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
  late Future<Map<String, dynamic>> weather;
  Future<Map<String, dynamic>> getCurrentWeather() async {
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
  void initState() {
    super.initState();
    weather = getCurrentWeather();
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
            IconButton(
                onPressed: () {
                  setState(() {
                    weather = getCurrentWeather();
                  });
                },
                icon: const Icon(Icons.refresh))
          ],
        ),
        body: FutureBuilder(
          future: weather,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            final data = snapshot.data!;
            final currentTemp = data["list"][0]["main"]["temp"];
            final currentSky = data["list"][0]["weather"][0]["main"];
            final currentPressure = data["list"][0]["main"]["pressure"];
            final currentWindSpeed = data["list"][0]["wind"]["speed"];
            final currentHumidity = data["list"][0]["main"]["humidity"];

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Main Card
                    MainCard(
                      temperature: "$currentTemp",
                      weather: currentSky,
                    ),
                    const SizedBox(
                      height: 17,
                    ),
                    //Weather forecast

                    const Text(
                      "Weather Forecast",
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 17,
                    ),
                    //Scrollable Weather forecast

                    SizedBox(
                      height: 120,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: ((context, index) {
                            final weatherForecast = data["list"][index + 1];
                            final hourlySky =
                                weatherForecast["weather"][0]["main"];
                            final time =
                                DateTime.parse(weatherForecast["dt_txt"]);
                            return WeatherForecast(
                                time: DateFormat.j().format(time),
                                icon:
                                    hourlySky == "clouds" || hourlySky == "Rain"
                                        ? Icons.cloud
                                        : Icons.sunny,
                                temperature:
                                    weatherForecast["main"]["temp"].toString());
                          })),
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
                          value: "$currentHumidity",
                        ),
                        MyAdditionalInformation(
                          icon: Icons.wind_power,
                          condition: "wind Speed",
                          value: currentWindSpeed.toString(),
                        ),
                        MyAdditionalInformation(
                          icon: Icons.umbrella_outlined,
                          condition: "Pressure",
                          value: "$currentPressure",
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
