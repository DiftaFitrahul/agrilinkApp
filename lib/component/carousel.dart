import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gdsc_project/page/article_page.dart';

class CarouserlSliderPage extends ConsumerWidget {
  const CarouserlSliderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Widget> dataWidget = [
      InkWell(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (ctx) => ArticlePage()));
        },
        child: Stack(children: [
          SizedBox(
              width: 400,
              child: ClipRRect(
                child: Image.asset('assets/images/farmpedia.png',
                    fit: BoxFit.fill),
              )),
          const Positioned(
              bottom: 75,
              left: 32,
              right: 32,
              child: Text("Memilih Padi Terbaik Secara Sains",
                  maxLines: 2,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 23,
                  ))),
          Positioned(
            bottom: 20,
            left: 30,
            child: SizedBox(
              width: 400,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                      width: 40,
                      child: Image.asset('assets/images/person.png',
                          fit: BoxFit.fill)),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('John Does Nuts',
                          style: TextStyle(color: Colors.white, fontSize: 15)),
                      Text('Petani Power 100 juta',
                          style: TextStyle(
                              color: Colors.white.withOpacity(0.7),
                              fontSize: 12))
                    ],
                  )
                ],
              ),
            ),
          )
        ]),
      ),
    ];
    return CarouselSlider(
      items: dataWidget,
      options: CarouselOptions(
          enlargeFactor: 0.34,
          height: 280,
          enlargeCenterPage: true,
          autoPlay: true),
    );
  }
}
