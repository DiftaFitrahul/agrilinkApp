import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gdsc_project/component/carousel.dart';
import 'package:gdsc_project/component/farmpedia_content.dart';
import 'package:gdsc_project/component/title_component.dart';

class FarmPediaPage extends ConsumerStatefulWidget {
  const FarmPediaPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FarmPediaPageState();
}

class _FarmPediaPageState extends ConsumerState<FarmPediaPage> {
  final _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  int currentIndexFilter = 0;

  final List<String> filterList = [
    'All',
    'Stories',
    'Scientific',
    'Beginner',
    'Tips',
    'Low Budget',
    'Innovation'
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
            const TitleComponent(title: 'Featured Articles'),
            const CarouserlSliderPage(),
            const SizedBox(
              height: 22,
            ),
            const TitleComponent(title: 'For You'),
            SizedBox(
              height: 45,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 7,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    setState(() {
                      currentIndexFilter = index;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    padding:
                        const EdgeInsets.symmetric(vertical: 2, horizontal: 20),
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: const Color.fromARGB(255, 5, 130, 64),
                        ),
                        borderRadius: BorderRadius.circular(40),
                        gradient: (currentIndexFilter == index)
                            ? const LinearGradient(
                                colors: [
                                  Color.fromARGB(255, 5, 130, 64),
                                  Color.fromARGB(255, 122, 173, 82)
                                ],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              )
                            : null),
                    child: Center(
                      child: Text(
                        filterList[index],
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const FarmPediaContent(
                type: 'Content',
                title: 'Pak Luis si Pembajak Handal Trenggalek',
                imagePath: 'assets/images/farmpedia_content.png',
                name: 'John Does Nuts',
                dateUpload: 'Uploaded on 11:30 PM',
                photoProfil: 'assets/images/person.png'),
            const FarmPediaContent(
                type: 'Content',
                title: 'Pak Luis si Pembajak Handal Trenggalek',
                imagePath: 'assets/images/farmpedia_content.png',
                name: 'John Does Nuts',
                dateUpload: 'Uploaded on 11:30 PM',
                photoProfil: 'assets/images/person.png'),
            const FarmPediaContent(
                type: 'Content',
                title: 'Pak Luis si Pembajak Handal Trenggalek',
                imagePath: 'assets/images/farmpedia_content.png',
                name: 'John Does Nuts',
                dateUpload: 'Uploaded on 11:30 PM',
                photoProfil: 'assets/images/person.png')
          ],
        )),
      ),
    );
  }
}
