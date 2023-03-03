import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gdsc_project/component/filter_component.dart';
import 'package:gdsc_project/component/sell_item_component.dart';

class MarketPageBuyer extends ConsumerStatefulWidget {
  const MarketPageBuyer({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MarketPageBuyerState();
}

class _MarketPageBuyerState extends ConsumerState<MarketPageBuyer> {
  final _searchController = TextEditingController();
  final List<String> filterMarket = [
    'All',
    'Terdekat',
    'Terpopuler',
    'Termurah',
    'Termahal',
    'Rating Tertinggi'
  ];
  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 18),
            child: FilterComponent(filterList: filterMarket),
          ),
          Expanded(
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 15,
                    mainAxisExtent: 210),
                padding: EdgeInsets.all(12),
                itemCount: 22,
                itemBuilder: (context, index) => SellItemComponent(
                    imagePath: 'assets/images/rice.png',
                    price: '12.350',
                    riceName: 'Menthik',
                    distance: '1.3',
                    owner: 'Ahmad Zaki',
                    address: 'Pogung Barat, Yogyakarta')),
          ),
        ],
      )),
    );
  }
}
