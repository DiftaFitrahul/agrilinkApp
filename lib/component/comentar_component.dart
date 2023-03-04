import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CommentComponent extends ConsumerWidget {
  final List<Icon> rating;
  const CommentComponent({super.key, required this.rating});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final widthScreen = MediaQuery.of(context).size.width;
    return SizedBox(
      width: widthScreen * 0.8,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Row(
              children: rating,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text('Seller Ksabar.'),
          ),
          Row(
            children: [
              Image.asset(
                'assets/images/person.png',
                width: 40,
              ),
              const SizedBox(
                width: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Difta Fitrahul',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w600)),
                    Text('Petani power 100 juta',
                        style: TextStyle(fontSize: 12))
                  ],
                ),
              ),
            ],
          ),
          const Divider(
            color: Color.fromARGB(255, 5, 130, 64),
            thickness: 1,
          ),
        ],
      ),
    );
  }
}
