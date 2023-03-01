import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: TextField(
                        controller: _searchController,
                        decoration: const InputDecoration(
                            hintText: 'Search',
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                            ),
                            prefixIcon: Icon(Icons.search_rounded)),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: IconButton(
                          onPressed: () {}, icon: const Icon(Icons.person)))
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.25,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 5, 130, 64),
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  Positioned(
                      left: 10,
                      top: 10,
                      bottom: 10,
                      right: MediaQuery.of(context).size.width * 0.5,
                      child: Container(
                        height: 20,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12)),
                      ))
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
                              Icons.monetization_on_outlined,
                              color: Colors.white,
                              size: 33,
                            )),
                        const SizedBox(
                          height: 2,
                        ),
                        const Text('Sell',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600))
                      ]),
                    ],
                  ),
                )
              ])
            ],
          ),
        ),
      ),
    );
  }
}
