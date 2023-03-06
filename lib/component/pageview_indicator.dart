import 'package:flutter/material.dart';

class PageViewIndicator extends StatelessWidget {
  final int currentNumber;
  const PageViewIndicator({super.key, required this.currentNumber});

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List<Widget>.generate(
            3,
            (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: (index == currentNumber) ? 27 : 10,
                  height: 10,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                  margin: const EdgeInsetsDirectional.symmetric(horizontal: 7),
                )));
  }
}
