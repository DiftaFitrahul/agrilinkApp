import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gdsc_project/component/carousel.dart';

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
            Container(
              margin: EdgeInsets.symmetric(vertical: 15),
              width: widthScreen * 0.6,
              height: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  gradient: const LinearGradient(
                    colors: [
                      Color.fromARGB(255, 5, 130, 64),
                      Color.fromARGB(255, 122, 173, 82)
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  )),
              child: const Center(
                  child: Text(
                'Featured Articles',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 20),
              )),
            ),
            const CarouserlSliderPage(),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color: Colors.white,
                child: SizedBox(
                  width: widthScreen * 0.9,
                  height: 350,
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'CERITA',
                            style: TextStyle(
                                color: Color.fromARGB(255, 5, 130, 64),
                                fontSize: 25,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            'Pak Luis si Pembajak Handal Trenggalek',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ),
                        ]),
                  ),
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}
