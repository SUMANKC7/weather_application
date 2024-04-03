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
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            for (int i = 0; i < 5;i++)
                                WeatherForecast(
                                  time:data["list"][i]["dt_txt"],
                                  icon:  data["list"][i]["weather"][0]["main"]=="clouds" ||
                                  data["list"][i]["weather"][0]["main"]=="rain"?Icons.cloud:Icons.sunny,
                                  temperature: "${data["list"][i]["main"]["temp"]}",
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
