import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePageContent extends ConsumerWidget {
  final String title;
  final String imagePath;
  final String buttonTitle;
  final void Function() goToPage;
  const HomePageContent(
      {super.key,
      required this.title,
      required this.imagePath,
      required this.buttonTitle,
      required this.goToPage
      });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final widthScreen = MediaQuery.of(context).size.width;
    final heightScreen = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: InkWell(
        onTap: () {},
        child: Stack(
          children: [
            Center(
                child: SizedBox(
              height: heightScreen * 0.3,
              width: widthScreen * 0.9,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            )),
            Center(
              child: Container(
                height: heightScreen * 0.3,
                width: widthScreen * 0.9,
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Colors.black.withOpacity(0.8),
                      Colors.transparent
                    ], begin: Alignment.centerLeft, end: Alignment.centerRight),
                    borderRadius: BorderRadius.circular(20)),
              ),
            ),
            Positioned(
                top: 20,
                left: 50,
                child: SizedBox(
                  height: heightScreen * 0.3,
                  width: widthScreen * 0.7,
                  child: Text(title,
                      style:
                          const TextStyle(color: Colors.white, fontSize: 17)),
                )),
            Positioned(
              bottom: 20,
              left: 50,
              child: InkWell(
                onTap: goToPage,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 7, horizontal: 12),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(buttonTitle,
                          style: TextStyle(color: Colors.green[800])),
                      Icon(
                        Icons.arrow_forward,
                        color: Colors.green[800],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
