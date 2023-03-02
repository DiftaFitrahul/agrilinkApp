import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ArticlePage extends ConsumerWidget {
  const ArticlePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.46,
                  child: ClipRRect(
                    child: Image.asset(
                      'assets/images/farmpedia_hd.png',
                      fit: BoxFit.fill,
                    ),
                  )),
              const Positioned(
                  bottom: 105,
                  left: 37,
                  right: 20,
                  child: Text("Memilih Padi Terbaik Secara Sains",
                      maxLines: 2,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 28,
                      ))),
              Positioned(
                bottom: 40,
                left: 37,
                child: SizedBox(
                  width: 400,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                          width: 43,
                          child: Image.asset('assets/images/person.png',
                              fit: BoxFit.fill)),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('John Does Nuts',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14)),
                          const SizedBox(height: 5),
                          Text('Petani Power 100 juta',
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.7),
                                  fontSize: 11))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                  right: 30,
                  bottom: 40,
                  child: Row(
                    children: [
                      IconButton(
                          padding: EdgeInsets.zero,
                          alignment: Alignment.centerRight,
                          onPressed: () {},
                          icon: const Icon(
                            Icons.favorite,
                            size: 27,
                            color: Colors.red,
                          )),
                      const Padding(
                        padding: EdgeInsets.only(left: 3, right: 6),
                        child:
                            Text('100', style: TextStyle(color: Colors.white)),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.bookmark_outlined,
                            size: 27,
                            color: Color.fromARGB(255, 5, 130, 64),
                          ))
                    ],
                  )),
              Positioned(
                top: 50,
                left: 30,
                child: IconButton(
                  icon: const Icon(Icons.arrow_circle_left_rounded,
                      color: Colors.white, size: 40),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              )
            ],
          ),
          Expanded(
              child: ListView(
            children: const [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                  "Memilih padi terbaik secara sains merupakan hal penting bagi petani dan pelaku usaha di bidang pertanian. Padi yang baik memiliki banyak keuntungan, antara lain rendemen yang tinggi, tahan terhadap hama dan penyakit, serta kualitas hasil panen yang baik. Dalam artikel ini, akan dibahas beberapa faktor yang perlu diperhatikan dalam memilih padi terbaik secara sains. Kondisi lingkungan Kondisi lingkungan seperti ketinggian tempat, curah hujan, suhu udara, dan kelembapan sangat mempengaruhi pertumbuhan dan hasil panen padi. Oleh karena itu, pemilihan varietas padi yang tepat harus disesuaikan dengan kondisi lingkungan di wilayah tempat padi akan ditanam. Misalnya, varietas padi yang cocok untuk ditanam di dataran rendah belum tentu cocok untuk ditanam di dataran tinggi. Ketersediaan air Ketersediaan air yang cukup sangat penting bagi pertumbuhan padi. Ada beberapa varietas padi yang lebih tahan terhadap kekeringan atau memiliki kemampuan adaptasi pada kondisi lingkungan dengan ketersediaan air yang rendah. Oleh karena itu, sebelum memilih varietas padi yang akan ditanam, perlu dipertimbangkan faktor ketersediaan air di wilayah tersebut. Ketahanan terhadap hama dan penyakit Ketahanan terhadap hama dan penyakit sangat penting untuk menghindari kerugian pada hasil panen. Ada beberapa varietas padi yang lebih tahan terhadap hama dan penyakit tertentu. Sebelum memilih varietas padi, perlu dipertimbangkan jenis hama dan penyakit yang umum terjadi di wilayah tersebut, serta tingkat ketahanan varietas padi terhadap hama dan penyakit tersebut.",
                  textAlign: TextAlign.justify,
                ),
              )
            ],
          ))
        ],
      ),
    );
  }
}
