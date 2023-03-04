import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gdsc_project/page/auth_checker.dart';

import '../provider/auth_provider/auth_provider.dart';

class SettingsPage extends ConsumerStatefulWidget {
  const SettingsPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SettingsPageState();
}

class _SettingsPageState extends ConsumerState<SettingsPage> {
  final List<String> settingList = [
    'Appearance',
    'Accessibility',
    'Privacy',
    'Notifications',
    'Advanced',
    'Report a Bug',
    'Credits',
  ];

  List<IconButton> iconButton = [
    IconButton(
      icon: const Icon(
        Icons.star,
        size: 30,
      ),
      onPressed: () {},
    ),
    IconButton(
      icon: const Icon(
        Icons.accessibility,
        size: 30,
      ),
      onPressed: () {},
    ),
    IconButton(
      icon: const Icon(
        Icons.privacy_tip,
        size: 30,
      ),
      onPressed: () {},
    ),
    IconButton(
      icon: const Icon(
        Icons.notification_add,
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
        Icons.poll_rounded,
        size: 30,
      ),
      onPressed: () {},
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final widthScreen = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 12),
            width: widthScreen,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [
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
                          iconButton[index],
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
          ),
        )),
      ),
    );
  }
}
