import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SliderWidget extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;
  const SliderWidget(
      {super.key,
      required this.title,
      required this.description,
      required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(title),
        const SizedBox(
          height: 10,
        ),
        Image(
          image: AssetImage(imagePath),
        ),
        const SizedBox(height: 60),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60),
          child: Text(
            description,
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
          ),
        )
      ],
    );
  }
}
