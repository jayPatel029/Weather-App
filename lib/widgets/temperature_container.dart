import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';



class TempContainer extends StatelessWidget {
  const TempContainer({super.key, this.data});

  final String? data;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 250,
        margin: const EdgeInsets.symmetric(
            horizontal: 25, vertical: 25),
        padding: const EdgeInsets.all(26),
        decoration: BoxDecoration(
            color: Colors.white38,
            borderRadius: BorderRadius.circular(14)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(
              WeatherIcons.thermometer_exterior,
              size: 30,
            ),
            Row(
              mainAxisAlignment:
              MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                      0, 30, 0, 0),
                  child: Text(
                    '$data Cel.',
                    style: const TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ],
        ));;
  }
}
