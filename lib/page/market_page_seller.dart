import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gdsc_project/component/filter_component.dart';
import 'package:gdsc_project/component/sell_item_component.dart';
import 'package:gdsc_project/component/title_component.dart';

class MarketPageSeller extends ConsumerStatefulWidget {
  const MarketPageSeller({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MarketPageState();
}

class _MarketPageState extends ConsumerState<MarketPageSeller> {
  final _searchController = TextEditingController();

  
  List<String> dayHargaPasar = ['1 hr', '3 hr', '7 hr', '14 hr'];
  int dayHargaPasarIsSelected = 0;
  String dropdownValue = 'Basmati';
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
            const TitleComponent(title: 'Laman Petani'),
            Stack(children: [
              Container(
                width: widthScreen * 0.85,
                height: 310,
                margin: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color.fromARGB(255, 5, 130, 64),
                        Color.fromARGB(255, 122, 173, 82)
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(26)),
              ),
              Positioned(
                  top: 30,
                  left: 30,
                  right: 30,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: const Text(
                      'Harga Pasar',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromARGB(
                            255,
                            122,
                            173,
                            82,
                          ),
                          fontSize: 20),
                    ),
                  )),
              Positioned(
                bottom: 40,
                left: 10,
                child: SizedBox(
                  height: 180,
                  width: widthScreen * 0.8,
                  child: LineChart(LineChartData(
                      minX: 0,
                      maxX: 13,
                      minY: 0,
                      maxY: 5,
                      titlesData: FlTitlesData(
                          leftTitles: AxisTitles(
                              sideTitles: SideTitles(
                            reservedSize: 45,
                            showTitles: true,
                            getTitlesWidget: (value, meta) {
                              String text = '';
                              switch (value.toInt()) {
                                case 1:
                                  text = '14750';
                                  break;
                                case 2:
                                  text = '15000';
                                  break;
                                case 3:
                                  text = '15250';
                                  break;
                                case 4:
                                  text = '15500';
                                  break;
                              }
                              return Container(
                                  child: Text(
                                text,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 11),
                              ));
                            },
                          )),
                          topTitles: AxisTitles(
                              sideTitles: SideTitles(showTitles: false)),
                          rightTitles: AxisTitles(
                              sideTitles: SideTitles(showTitles: false)),
                          bottomTitles: AxisTitles(
                              sideTitles: SideTitles(showTitles: false))),
                      gridData: FlGridData(
                          show: true,
                          drawVerticalLine: false,
                          getDrawingHorizontalLine: (value) {
                            return FlLine(
                              color: const Color.fromARGB(255, 122, 173, 82),
                              strokeWidth: 3,
                            );
                          }),
                      borderData: FlBorderData(show: false),
                      lineBarsData: [
                        LineChartBarData(color: Colors.white, spots: const [
                          FlSpot(0, 3),
                          FlSpot(3, 2.3),
                          FlSpot(4.9, 4),
                          FlSpot(5, 1),
                          FlSpot(8.2, 4),
                          FlSpot(9, 2),
                          FlSpot(11, 2.7),
                        ])
                      ])),
                ),
              ),
              Positioned(
                right: 30,
                left: 25,
                bottom: 20,
                child: SizedBox(
                  height: 37,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        setState(() {
                          dayHargaPasarIsSelected = index;
                        });
                      },
                      child: Card(
                        color: (dayHargaPasarIsSelected == index)
                            ? Colors.white
                            : const Color.fromARGB(255, 122, 173, 82),
                        shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(18)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Center(
                            child: Text(
                              dayHargaPasar[index],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: (dayHargaPasarIsSelected == index)
                                      ? const Color.fromARGB(255, 5, 130, 64)
                                      : Colors.white,
                                  fontSize: 13),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                  right: 20,
                  left: 20,
                  top: 85,
                  child: SizedBox(
                    height: 37,
                    child: Row(
                      children: [
                        const Icon(
                          Icons.arrow_drop_up_sharp,
                          size: 50,
                          color: Colors.yellow,
                        ),
                        const Text('15.180,-/',
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)),
                        const Text('kg',
                            style:
                                TextStyle(color: Colors.white, fontSize: 15)),
                        const Expanded(child: SizedBox()),
                        DropdownButton<String>(
                          dropdownColor: const Color.fromARGB(255, 5, 130, 64),
                          value: dropdownValue,
                          icon: const Icon(Icons.arrow_drop_down,
                              color: Colors.white),
                          isDense: true,
                          items: <String>[
                            'Menthik',
                            'Basmati',
                            'Rojo Lele',
                            'C4'
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: const TextStyle(
                                    fontSize: 14, color: Colors.white),
                              ),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValue = newValue!;
                            });
                          },
                        ),
                      ],
                    ),
                  ))
            ]),
            
            
          ],
        )),
      ),
    );
  }
}
