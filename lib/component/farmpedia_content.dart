import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FarmPediaContent extends ConsumerWidget {
  final String type;
  final String title;
  final String imagePath;
  final String name;
  final String dateUpload;
  final String photoProfil;
  const FarmPediaContent(
      {super.key,
      required this.type,
      required this.title,
      required this.imagePath,
      required this.name,
      required this.dateUpload,
      required this.photoProfil});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final widthScreen = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: Colors.white,
        child: SizedBox(
          width: widthScreen * 0.9,
          height: 510,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Text(
                    type,
                    style: const TextStyle(
                        color: Color.fromARGB(255, 5, 130, 64),
                        fontSize: 25,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                   Text(
                    title,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 25),
                    child: Image.asset(imagePath),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                          width: 43,
                          child: Image.asset(photoProfil,
                              fit: BoxFit.fill)),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           Text(name,
                              style:const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontSize: 12)),
                          const SizedBox(height: 5),
                          Text('Petani Power 100 juta',
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.7),
                                  fontSize: 10.5))
                        ],
                      ),
                      const Expanded(child: SizedBox()),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('John Does Nuts',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                  fontSize: 12)),
                          const SizedBox(height: 5),
                          Text(dateUpload,
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.7),
                                  fontSize: 10.5))
                        ],
                      )
                    ],
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
