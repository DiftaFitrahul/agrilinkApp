import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:gdsc_project/component/pageview_indicator.dart';
import 'package:gdsc_project/component/slider_widget.dart';

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
        title: 'title',
        description: 'description',
        imagePath: 'assets/images/monitoring.png'),
    const SliderWidget(
        title: 'makan',
        description: 'description',
        imagePath: 'assets/images/monitoring.png'),
    const SliderWidget(
        title: 'nasi',
        description:
            'description about makan nasi padang di rumahnya teman saya yang bernama tidak tahu',
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
