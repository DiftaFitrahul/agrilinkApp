import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gdsc_project/component/home_page_content.dart';
import 'package:gdsc_project/page/account_page.dart';
import 'package:gdsc_project/page/auth_checker.dart';
import 'package:gdsc_project/page/farmpedia_page.dart';
import 'package:gdsc_project/page/forums_page.dart';
import 'package:gdsc_project/page/market_page_seller.dart';
import 'package:gdsc_project/page/settings_page.dart';
import 'package:gdsc_project/provider/auth_provider/auth_provider.dart';

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
                            constraints: BoxConstraints(),
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
                      height: MediaQuery.of(context).size.height * 0.19,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 5, 130, 64),
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    Positioned(
                        left: 15,
                        top: 15,
                        bottom: 15,
                        right: MediaQuery.of(context).size.width * 0.45,
                        child: Container(
                          height: 20,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12)),
                        )),
                    Positioned(
                      right: 15,
                      top: 15,
                      bottom: 15,
                      child: SizedBox(
                        width: widthScreen * 0.36,
                        height: heightScreen * 0.15,
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 20,
                                  crossAxisSpacing: 15,
                                  mainAxisExtent: 53),
                          itemCount: 4,
                          itemBuilder: (context, index) => InkWell(
                              onTap: () {},
                              child: Container(
                                width: 20,
                                height: 45,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12)),
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
                              onPressed: () {},
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
                const HomePageContent(
                  title: 'Mau tahu lebih banyak tentang bertani',
                  imagePath: 'assets/images/farm-1.png',
                  buttonTitle: 'Farmpedia',
                ),
                const HomePageContent(
                  title:
                      'Mau beli beras sesuai budget dan kualitas yang diinginkan?',
                  imagePath: 'assets/images/farm-2.png',
                  buttonTitle: 'Sudah Waktunya ke Market',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
