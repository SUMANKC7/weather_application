import 'package:flutter/material.dart';

class MainCard extends StatelessWidget {
  const MainCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: double.infinity,
      child: Card(
        child: Column(
          children: [
            Text("230.7",
            style: TextStyle(fontSize: 32,
            fontWeight: FontWeight.bold),
            ),
              
          ],
        ),
      ),
    );
  }
}
