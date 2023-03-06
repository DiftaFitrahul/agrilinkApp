import 'package:flutter/material.dart';

class TitleComponent extends StatelessWidget {
  final String title;
  const TitleComponent({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final widthScreen = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: widthScreen * 0.6,
      height: 55,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(0.7),
              offset: const Offset(0, 0),
              spreadRadius: 4,
              blurRadius: 4,
            )
          ],
          borderRadius: BorderRadius.circular(50),
          gradient: const LinearGradient(
            colors: [
              Color.fromARGB(255, 5, 130, 64),
              Color.fromARGB(255, 122, 173, 82)
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          )),
      child: Center(
          child: Text(
        title,
        style: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.w500, fontSize: 20),
      )),
    );
  }
}
