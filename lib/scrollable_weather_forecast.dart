import 'package:flutter/material.dart';

class WeatherForecast extends StatelessWidget {
  const WeatherForecast({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
     
      child: Card(
        
        
        child:Container(
          width: 100,
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
          ),
          child:const  Column(
            children: [
              Text("9:00",style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold
              ),
              ),
              SizedBox(height: 8,
              ),
              Icon(Icons.cloud,size: 32,),
               SizedBox(height: 8,
              ),
              Text("301.17",style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal),
                )
            ],
          ),
        ),
      ),
    );
  }
}