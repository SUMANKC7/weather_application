import 'dart:ui';

import 'package:flutter/material.dart';

class MainCard extends StatelessWidget {
  final String temperature;
  final String weather;
  const MainCard({super.key, required this.temperature, required this.weather});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "$temperature K",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Icon(
                  weather=="Rain" || weather=="Cloud"? 
                  Icons.cloud:Icons.sunny,
                
                  size: 50,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  weather,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
