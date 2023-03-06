import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../component/weather_time_symbol.dart';

class WeatherComponent extends ConsumerWidget {
  const WeatherComponent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final widthScreen = MediaQuery.of(context).size.width;
    return Container(
      height: 400,
      width: widthScreen * 0.9,
      margin: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          offset: const Offset(3, 3),
          color: Colors.black.withOpacity(0.3),
          spreadRadius: 2,
          blurRadius: 5,
        )
      ], color: Colors.white, borderRadius: BorderRadius.circular(30)),
      child: Stack(
        children: [
          Container(
            height: 270,
            width: double.infinity,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  offset: const Offset(2, 4),
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 1)
            ], color: Colors.white, borderRadius: BorderRadius.circular(30)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.asset(
                'assets/images/weather-1.png',
                fit: BoxFit.fill,
              ),
            ),
          ),
          Container(
            height: 270,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                gradient: LinearGradient(
                    colors: [Colors.black.withOpacity(0.8), Colors.transparent],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter)),
          ),
          const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text('Cerah',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 40))),
          ),
          const Align(
            alignment: Alignment.centerRight,
            child: Padding(
                padding: EdgeInsets.only(right: 20),
                child: Text('32°',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 50))),
          ),
          Positioned(
            bottom: 10,
            left: 23,
            child: Row(
              children: const [
                WeatherTimeSymbol(
                  titleWeather: 'Awan',
                  weatherIconPath: 'assets/icons/Weather/awan.png',
                  time: '07.00',
                  verticalDivider: true,
                ),
                WeatherTimeSymbol(
                  titleWeather: 'Cerah',
                  weatherIconPath: 'assets/icons/Weather/cerah.png',
                  time: '10.00',
                  verticalDivider: true,
                ),
                WeatherTimeSymbol(
                  titleWeather: 'Aerah',
                  weatherIconPath: 'assets/icons/Weather/awan.png',
                  time: '13.00',
                  verticalDivider: true,
                ),
                WeatherTimeSymbol(
                  titleWeather: 'Aerah',
                  weatherIconPath: 'assets/icons/Weather/awan.png',
                  time: '17.00',
                  verticalDivider: true,
                ),
                WeatherTimeSymbol(
                  titleWeather: 'Hujan',
                  weatherIconPath: 'assets/icons/Weather/hujan.png',
                  time: '21.00',
                  verticalDivider: false,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
