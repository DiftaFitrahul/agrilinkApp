import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../page/item_buyer_page.dart';

class SellItemComponent extends ConsumerWidget {
  final String imagePath;
  final String price;
  final String riceName;
  final String distance;
  final String owner;
  final String address;
  const SellItemComponent(
      {super.key,
      required this.imagePath,
      required this.price,
      required this.riceName,
      required this.distance,
      required this.owner,
      required this.address});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final widthScreen = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (ctx) => MarketBuyerPage()));
      },
      child: Container(
        width: widthScreen * 0.45,
        height: 200,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  offset: const Offset(3, 4),
                  spreadRadius: 2,
                  blurRadius: 4)
            ]),
        child: Stack(
          children: [
            SizedBox(
              width: widthScreen * 0.45,
              height: 120,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: widthScreen * 0.45,
                height: 90,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12))),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 11, horizontal: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            riceName,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                          Text('$distance km',
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 12))
                        ],
                      ),
                      Text(
                        owner,
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 11),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on_outlined,
                            size: 15,
                            color: Color.fromARGB(255, 5, 130, 64),
                          ),
                          SizedBox(
                            width: widthScreen * 0.31,
                            child: Text(
                              address,
                              style: const TextStyle(
                                  fontSize: 10,
                                  color: Color.fromARGB(255, 122, 173, 82)),
                              overflow: TextOverflow.ellipsis,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              right: 10,
              bottom: 83,
              child: Container(
                width: 90,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  child: Row(
                    children: [
                      Text('Rp $price/', style: const TextStyle(fontSize: 12)),
                      const Text('kg', style: TextStyle(fontSize: 10))
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
