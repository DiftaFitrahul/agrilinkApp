import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../component/home_page_content.dart';
import '../component/weather_component.dart';
import '../page/account_page.dart';
import '../page/farmpedia_page.dart';
import '../page/market_page_seller.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<String> typeGrid = ['Beli Beras', 'Ganti Peran'];

  @override
  Widget build(BuildContext context) {
    final widthScreen = MediaQuery.of(context).size.width;
    final heightScreen = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
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
                    const SizedBox(
                      width: 12,
                    ),
                    Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25)),
                        child: IconButton(
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (ctx) => AccountPage()));
                            },
                            icon: Image.asset(
                              'assets/images/accountUser.png',
                              fit: BoxFit.fill,
                            )))
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Stack(
                  children: [
                    Container(
                      height: 180,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 5, 130, 64),
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    Positioned(
                        left: 15,
                        top: 15,
                        bottom: 15,
                        right: MediaQuery.of(context).size.width * 0.36,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 12.0, horizontal: 17),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'AgriPoints',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                const SizedBox(
                                  height: 9,
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 18),
                                  decoration: BoxDecoration(
                                      color:
                                          const Color.fromARGB(255, 5, 130, 64),
                                      borderRadius: BorderRadius.circular(12)),
                                  child: const Text('2030 Pts',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 26)),
                                ),
                                const SizedBox(
                                  height: 9,
                                ),
                                const Text(
                                  'Sampai 23 Feb 2024',
                                  style: TextStyle(
                                      color: Colors.black87, fontSize: 13),
                                ),
                              ],
                            ),
                          ),
                        )),
                    Positioned(
                      right: 15,
                      top: 15,
                      bottom: 15,
                      child: SizedBox(
                        width: widthScreen * 0.27,
                        height: heightScreen * 0.15,
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 1,
                                  mainAxisSpacing: 20,
                                  crossAxisSpacing: 15,
                                  mainAxisExtent: 60),
                          itemCount: typeGrid.length,
                          itemBuilder: (context, index) => InkWell(
                              onTap: () {},
                              child: Container(
                                width: 20,
                                height: 45,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12)),
                                child: Text(
                                  typeGrid[index],
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16),
                                ),
                              )),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Stack(children: [
                  Container(
                      width: double.infinity,
                      height: 80,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 5, 130, 64),
                          borderRadius: BorderRadius.circular(20))),
                  Positioned(
                    left: 0,
                    right: 10,
                    bottom: 0,
                    top: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(children: [
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.article,
                                color: Colors.white,
                                size: 33,
                              )),
                          const SizedBox(
                            height: 2,
                          ),
                          const Text('articles',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600))
                        ]),
                        Column(children: [
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.tag_faces_outlined,
                                color: Colors.white,
                                size: 33,
                              )),
                          const SizedBox(
                            height: 2,
                          ),
                          const Text('Beginner',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600))
                        ]),
                        Column(children: [
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.monitor,
                                color: Colors.white,
                                size: 33,
                              )),
                          const SizedBox(
                            height: 2,
                          ),
                          const Text('Monitor',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600))
                        ]),
                        Column(children: [
                          IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (ctx) => const MarketPageSeller()));
                              },
                              icon: const Icon(
                                Icons.store,
                                color: Colors.white,
                                size: 33,
                              )),
                          const SizedBox(
                            height: 2,
                          ),
                          const Text('Market',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600))
                        ]),
                      ],
                    ),
                  ),
                ]),
                const WeatherComponent(),
                HomePageContent(
                  title: 'Mau tahu lebih banyak tentang bertani',
                  imagePath: 'assets/images/farm-1.png',
                  buttonTitle: 'Farmpedia',
                  goToPage: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (ctx) => const FarmPediaPage()));
                  },
                ),
                HomePageContent(
                  title:
                      'Mau beli beras sesuai budget dan kualitas yang diinginkan?',
                  imagePath: 'assets/images/farm-2.png',
                  buttonTitle: 'Sudah Waktunya ke Market',
                  goToPage: () {},
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
