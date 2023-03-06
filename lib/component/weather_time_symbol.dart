import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WeatherTimeSymbol extends ConsumerWidget {
  final String titleWeather;
  final String weatherIconPath;
  final String time;
  final bool verticalDivider;
  const WeatherTimeSymbol(
      {super.key,
      required this.titleWeather,
      required this.weatherIconPath,
      required this.time,
      required this.verticalDivider});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 105,
      width: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 7),
                  child: Text(titleWeather)),
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Image.asset(weatherIconPath),
              ),
              Text(time),
            ],
          ),
          const SizedBox(
            width: 7,
          ),
          if (verticalDivider)
            const VerticalDivider(
              thickness: 1.7,
              color: Color.fromARGB(255, 5, 130, 64),
            ),
        ],
      ),
    );
  }
}
