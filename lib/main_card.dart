import 'dart:ui';

import 'package:flutter/material.dart';

class MainCard extends StatelessWidget {
  const MainCard({super.key});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: double.infinity,
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 10,
              sigmaY: 10
            ),
            child: const Column(
              children: [
                  SizedBox(height: 10,),
                Text("230.7",
                style: TextStyle(fontSize: 32,
                fontWeight: FontWeight.bold),
                ),
                    SizedBox(height: 10,),
                Icon(Icons.cloud,size: 50,),
                SizedBox(height: 10,),
                Text("Rain",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),),
                  SizedBox(height: 10,),  
              ],
            ),
          ),
        ),
      ),
    );
  }
}
