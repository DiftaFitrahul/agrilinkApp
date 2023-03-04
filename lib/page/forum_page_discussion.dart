import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gdsc_project/component/commentar_forum_component.dart';

class ForumPageDiscussion extends ConsumerStatefulWidget {
  const ForumPageDiscussion({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ForumPageDiscussionState();
}

class _ForumPageDiscussionState extends ConsumerState<ForumPageDiscussion> {
  final _searchController = TextEditingController();
  final _commentController = TextEditingController();

  @override
  void dispose() {
    _commentController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  List<Widget> comments = [
    const CommentarForum(
        comment:
            'Kapan ya waktu yang tepat untuk menanam padi? Saya ingin memiliki padi yang baik dengan effort yang sedikit.'),
    const CommentarForum(
      comment:
          'Kita perlu tahu kapan musim yang tepat, terutama di negeri indonesi ini',
    ),
    const CommentarForum(
        comment:
            'Informasi mengenai dunia pertanian mudah didapatkan di buku-buku'),
    const CommentarForum(
        comment:
            'Bila kita lihat dari sektor pangan kita, terutama padi karena memang makanan pokok kita itu nasi. bisa kita lihat bahwa kondisi beras masih kurang menyainkan, dan juga dari stok beras itu juga kurang bagus sehingga kita perlu')
  ];

  @override
  Widget build(BuildContext context) {
    final widthScreen = MediaQuery.of(context).size.width;
    final heightScreen = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(10),
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Search',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25)),
                    prefixIcon: const Icon(Icons.search_rounded)),
              ),
            ),
            Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 22),
                child: Container(
                  width: widthScreen * 0.9,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: const Color.fromARGB(255, 74, 74, 74)
                                .withOpacity(0.3),
                            offset: const Offset(3, 3),
                            blurRadius: 2,
                            spreadRadius: 2)
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Align(
                            alignment: Alignment.topCenter,
                            child: Container(
                              width: double.infinity,
                              height: 130,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  gradient: const LinearGradient(
                                    colors: [
                                      Color.fromARGB(255, 5, 130, 64),
                                      Color.fromARGB(255, 122, 173, 82)
                                    ],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                  )),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 30, left: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      'NEW - Thread',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 22,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      'Perfect Timing to Plant Rice',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 22,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      ...comments
                    ],
                  ),
                )),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 30),
              width: widthScreen * 0.9,
              height: 340,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 5, 130, 64),
                  borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 18, horizontal: 10),
                      child: Text(
                        'Balas ke Diskusi',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 19,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    TextField(
                      controller: _commentController,
                      keyboardType: TextInputType.multiline,
                      maxLines: 7,
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12))),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Membalas sebagai',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400),
                              ),
                              Text(
                                'Giga Hidjrika Aura Adky',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          const Expanded(child: SizedBox()),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                comments.add(CommentarForum(
                                    comment: _commentController.text));
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 15),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: const Text(
                                'Kirim',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Color.fromARGB(255, 5, 130, 64),
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}
