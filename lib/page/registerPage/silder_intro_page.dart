import 'package:flutter/material.dart';

import '../../component/pageview_indicator.dart';
import '../../component/slider_widget.dart';

class SliderIntroPage extends StatefulWidget {
  const SliderIntroPage({super.key});

  @override
  State<SliderIntroPage> createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderIntroPage> {
  int currentNumber = 0;
  final _pageController = PageController();

  final List<Widget> pages = [
    const SliderWidget(
        title: "It's time to start your journey with us",
        description: 'Monitor your farm in real time. Forget the hassle',
        imagePath: 'assets/images/monitoring.png'),
    const SliderWidget(
        title: "It's time to start your journey with us",
        description: 'Monitor your farm in real time. Forget the hassle',
        imagePath: 'assets/images/monitoring.png'),
    const SliderWidget(
        title: "It's time to start your journey with us",
        description: 'Monitor your farm in real time. Forget the hassle',
        imagePath: 'assets/images/monitoring.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.7,
      child: Stack(
        children: [
          PageView.builder(
            scrollDirection: Axis.horizontal,
            controller: _pageController,
            itemCount: pages.length,
            onPageChanged: (value) {
              setState(() {
                currentNumber = value;
              });
            },
            itemBuilder: (context, index) => pages[index],
          ),
          Positioned(
              bottom: MediaQuery.of(context).size.height * 0.25,
              right: 0,
              left: 0,
              child: PageViewIndicator(
                currentNumber: currentNumber,
              ))
        ],
      ),
    );
  }
}
