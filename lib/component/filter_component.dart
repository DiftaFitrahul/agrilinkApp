import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FilterComponent extends ConsumerStatefulWidget {
  final List<String> filterList;
  const FilterComponent({super.key, required this.filterList});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _FilterComponentState();
}

class _FilterComponentState extends ConsumerState<FilterComponent> {
  int currentIndexFilter = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.filterList.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            setState(() {
              currentIndexFilter = index;
            });
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 20),
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
                widget.filterList[index],
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
