import 'package:flutter/material.dart';

class MyAdditionalInformation extends StatelessWidget {
  final IconData icon;
  final String condition;
  final String value;
  const MyAdditionalInformation({super.key, 
  required this.icon,
   required this.condition,
    required this.value});

  @override
  Widget build(BuildContext context) {
    return  Card(
      elevation: 0,
      child: Padding(
        padding:const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Icon(
             icon,
              size: 32,
            ),
           const SizedBox(
              height: 13,
            ),
            Text(
              condition,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
            ),
           const SizedBox(
              height: 9,
            ),
            Text(
             value,
              style:const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
