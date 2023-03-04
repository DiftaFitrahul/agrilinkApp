import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CommentarForum extends ConsumerWidget {
  final String comment;
  const CommentarForum({super.key, required this.comment});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Text(
            comment,
            textAlign: TextAlign.justify,
            style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
          ),
          const SizedBox(height: 7),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Image.asset(
                  'assets/images/person.png',
                  width: 37,
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Difta Fitrahul',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600)),
                    Text('Petani power 100jt', style: TextStyle(fontSize: 12))
                  ],
                ),
                const Expanded(child: SizedBox()),
                IconButton(
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    onPressed: () {},
                    icon: const Icon(
                      Icons.reply,
                      size: 20,
                    )),
                const SizedBox(
                  width: 6,
                ),
                IconButton(
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    onPressed: () {},
                    icon: const Icon(
                      Icons.thumb_up,
                      size: 20,
                    )),
                const Padding(
                  padding: EdgeInsets.only(right: 6, left: 2),
                  child: Text('12'),
                ),
                IconButton(
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    onPressed: () {},
                    icon: const Icon(
                      Icons.thumb_down,
                      size: 20,
                    )),
                const Padding(
                  padding: EdgeInsets.only(left: 2),
                  child: Text('5'),
                ),
              ],
            ),
          ),
          const Divider(
            color: Color.fromARGB(255, 5, 130, 64),
            thickness: 1.5,
          ),
        ],
      ),
    );
  }
}
