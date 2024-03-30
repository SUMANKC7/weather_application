import 'package:flutter/material.dart';

class MyAdditionalInformation extends StatelessWidget {
  const MyAdditionalInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      elevation: 0,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Icon(Icons.water_drop,size: 32,),
            SizedBox(height: 13,),
            Text("Humidity",style:
            TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal),
        
            ),
            SizedBox(height: 9,),
             Text("94",style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
                ),
          ],
        ),
      ),
    );
  }
}