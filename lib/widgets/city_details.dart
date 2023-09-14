import 'package:flutter/material.dart';
import 'package:weather_app/utils/utils.dart';

class CityDetails extends StatelessWidget {
  const CityDetails({
    super.key,
    this.dataDescription, this.dataI, this.dataName,
  });

  final String? dataDescription;
  final String? dataI;
  final String? dataName;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
      const EdgeInsets.symmetric(horizontal: 25),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white38,
          borderRadius: BorderRadius.circular(14)),
      child: Row(
        children: [
          Image.network(
              'https://openweathermap.org/img/wn/$dataI@2x.png'),
          const SizedBox(
            width: 20,
          ),
          Column(
            children: [
              Text(
                dataDescription!,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                dataName!,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
