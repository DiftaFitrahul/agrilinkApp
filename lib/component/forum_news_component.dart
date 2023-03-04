import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ForumNewsComponent extends ConsumerWidget {
  const ForumNewsComponent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final widthScreen = MediaQuery.of(context).size.width;
    return SizedBox(
      width: widthScreen * 0.85,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text('NEW',
                  style: TextStyle(
                    color: Color.fromARGB(255, 5, 130, 64),
                  )),
              const SizedBox(
                width: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Perfect Timing to Plant Rice',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600)),
                    Text('Started by Zaki Hidjrika',
                        style: TextStyle(fontSize: 12))
                  ],
                ),
              ),
              const Expanded(child: SizedBox()),
              SizedBox(
                height: 50,
                width: 80,
                child: Stack(
                  children: const [
                    Positioned(
                      left: 0,
                      child: Icon(
                        Icons.arrow_drop_up,
                        color: Color.fromARGB(255, 5, 130, 64),
                        size: 32,
                      ),
                    ),
                    Positioned(
                      left: 27,
                      top: 12,
                      child: Text('11',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            height: 0.77,
                            fontSize: 12,
                          )),
                    ),
                    Positioned(
                      left: 39,
                      top: 0,
                      child: Icon(
                        Icons.arrow_drop_down,
                        color: Colors.red,
                        size: 32,
                      ),
                    ),
                    Positioned(
                      right: 8,
                      top: 10,
                      child: Text('0',
                          style: TextStyle(
                            fontSize: 12,
                          )),
                    ),
                    Positioned(
                      bottom: 2,
                      left: 15,
                      child: Text('2 Mar 23',
                          style:
                              TextStyle(fontSize: 12, color: Colors.black54)),
                    )
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
