import 'package:flutter/material.dart';
import 'package:weather_app/utils/utils.dart';
import 'package:weather_icons/weather_icons.dart';

class ContWidget extends StatelessWidget {
  const ContWidget({
    super.key,
    required this.data,
    required this.prefix,
    this.dataW, this.WeatherIcons,
  });

  final String data;
  final WeatherIcons;
  final String prefix;
  final String? dataW;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      //! wind
      child: Container(
        height: 200,
        margin: const EdgeInsets.fromLTRB(20, 20, 10, 0),
        padding: const EdgeInsets.all(26),
        decoration: BoxDecoration(
            color: Colors.white38, borderRadius: BorderRadius.circular(14)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(WeatherIcons),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              data,
              style: const TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
            Text(prefix,
                style: TextStyle(
                  fontSize: 16,
                )),
          ],
        ),
      ),
    );
  }
}
