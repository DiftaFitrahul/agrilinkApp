import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gdsc_project/page/auth_checker.dart';

import '../provider/auth_provider/auth_provider.dart';

class AccountPage extends ConsumerWidget {
  AccountPage({super.key});

  final List<String> settingList = [
    'Kontribusi',
    'Artikel Tersimpan',
    'Metode Pembayaran',
    'Riwayat Transaksi',
    'Help',
    'Customer Support',
    'Sign Out'
  ];

  List iconButton(BuildContext context, WidgetRef ref) {
    return [
      IconButton(
        icon: const Icon(
          Icons.star,
          size: 30,
        ),
        onPressed: () {},
      ),
      IconButton(
        icon: const Icon(
          Icons.bookmark,
          size: 30,
        ),
        onPressed: () {},
      ),
      IconButton(
        icon: const Icon(
          Icons.monetization_on,
          size: 30,
        ),
        onPressed: () {},
      ),
      IconButton(
        icon: const Icon(
          Icons.history,
          size: 30,
        ),
        onPressed: () {},
      ),
      IconButton(
        icon: const Icon(
          Icons.help,
          size: 30,
        ),
        onPressed: () {},
      ),
      IconButton(
        icon: const Icon(
          Icons.support_agent_sharp,
          size: 30,
        ),
        onPressed: () {},
      ),
      IconButton(
        icon: const Icon(
          Icons.logout_outlined,
          size: 30,
        ),
        onPressed: () {
          ref.read(authProvider).signOut().then((_) {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (dialogcontext) => const AuthChecker(),
                ));
          });
        },
      ),
    ];
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final widthScreen = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      size: 30,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/images/accountUser.png',
                    width: 90,
                  ),
                  const SizedBox(
                    width: 18,
                  ),
                  SizedBox(
                    width: widthScreen * 0.6,
                    height: 120,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Albert Enstein',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 22),
                        ),
                        const Text(
                          'penggilafisika@gmail.com',
                          style: TextStyle(fontSize: 13),
                        ),
                        const Text(
                          '+6281298639172',
                          style: TextStyle(fontSize: 13),
                        ),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 14),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                gradient: const LinearGradient(
                                  colors: [
                                    Color.fromARGB(255, 5, 130, 64),
                                    Color.fromARGB(255, 122, 173, 82)
                                  ],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                              ),
                              child: const Text(
                                'Farmer',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            const Expanded(child: SizedBox()),
                            TextButton(
                                onPressed: () {},
                                child: const Text('Edit',
                                    style: TextStyle(color: Colors.black)))
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              const Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Pengaturan Account',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 24))),
              const SizedBox(
                height: 12,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: settingList.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Row(
                      children: [
                        iconButton(context, ref)[index],
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          settingList[index],
                          style: const TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
