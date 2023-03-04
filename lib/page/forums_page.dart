import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gdsc_project/component/forum_news_component.dart';

import '../component/title_component.dart';

class ForumsPage extends ConsumerStatefulWidget {
  const ForumsPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ForumsPageState();
}

class _ForumsPageState extends ConsumerState<ForumsPage> {
  final _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<String> title = [
    'Irigation Technique',
    'Planting Strategis',
    'All about Rice',
    'Inovation in Technologi',
    'Robot help Farmer',
    'Hama dan Pengobatan tanaman',
    'Kelola Tanah dengan Baik',
    'Pemasaran Beras',
    'Pengolahan Beras'
  ];

  List<String> subtitle = [
    'NEW: This is how to make Irigation good',
    'NEW: Planting using tradisional way is not good',
    'UPDATE: New variance Rice',
    'NEW: Using this machine can help',
    'UPDATE: Farm robotic can make a ',
    'UPDATE: Cara mengatasi hama dengan efektif',
    'NEW: Cara mengatasi tanah hasil panen',
    'Pemasaran Beras',
    'Pengolahan Beras',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
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
          const TitleComponent(title: 'Forums'),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 10),
              child: ListView.builder(
                itemCount: title.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 7),
                  child: ExpansionTile(
                    tilePadding: EdgeInsets.all(20),
                    title: Text(
                      title[index],
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    subtitle: Text(
                      subtitle[index],
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 17, color: Colors.black54),
                    ),
                    trailing: const Text('11',
                        style: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 5, 130, 64),
                        )),
                    backgroundColor: Colors.white,
                    collapsedBackgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    collapsedShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    children: const [
                      ForumNewsComponent(),
                      ForumNewsComponent(),
                      ForumNewsComponent(),
                      ForumNewsComponent(),
                      ForumNewsComponent(),
                      ForumNewsComponent(),
                      ForumNewsComponent(),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}
