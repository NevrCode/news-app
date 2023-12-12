import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../costum/carousel_item.dart';
import '../costum/newscard.dart';
import '../sqlite_handler.dart';
import 'package:sqflite/sqflite.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  CarouselController cCbtn = CarouselController();

  Future<List<NewsCard>> generateNewsIconsFromDB() async {
    Database db = await SqliteHandler().openDB();
    List<Map<String, dynamic>> rows = await db.query('landing_kampos');
    final dataList = await db.rawQuery(
        'SELECT judul,SUBSTR(isi,1,30) AS isi, icon_image_path FROM landing_kampos');

    return List.generate(
      rows.length,
      (index) => NewsCard(
          judulBerita: dataList[index]["judul"] as String,
          isiBerita: dataList[index]["isi"] as String,
          imagePath: dataList[index]["icon_image_path"] as String),
    );
  }

  Future<List<CarouselItem>> generateCarouselItemFromDB() async {
    Database db = await SqliteHandler().openDB();
    List<Map<String, dynamic>> rows = await db.query('landing_kampos');
    final dataList = await db.rawQuery(
        'SELECT judul,SUBSTR(isi,1,30) AS isi, carousel_image_path FROM landing_kampos');

    return List.generate(
      rows.length,
      (index) => CarouselItem(
          judulBerita: dataList[index]["judul"] as String,
          isiBerita: dataList[index]["isi"] as String,
          imagePath: dataList[index]["carousel_image_path"] as String),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: scaffoldKey,
      backgroundColor: const Color.fromARGB(255, 241, 244, 248),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 253, 253, 255),
        automaticallyImplyLeading: false,
        title: const Row(
          children: [
            Text(
              'Kampos',
              style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontFamily: "Readex",
                fontSize: 22,
              ),
            ),
            Text(
              '.com',
              style: TextStyle(
                color: Color.fromARGB(255, 201, 94, 94),
                fontFamily: "Readex",
                fontSize: 22,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            style: ButtonStyle(
              fixedSize: MaterialStateProperty.all(const Size(40, 40)),
            ),
            icon: const Icon(
              Icons.person_outline_sharp,
              color: Color.fromARGB(255, 224, 227, 231),
              size: 24,
            ),
            onPressed: () {},
          ),
        ],
        centerTitle: false,
        elevation: 2,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsetsDirectional.fromSTEB(15, 17, 0, 0),
                child: Text(
                  'Trending News',
                  style: TextStyle(
                    fontFamily: 'Readex',
                    fontSize: 18,
                    color: Color.fromARGB(255, 184, 1, 1),
                  ),
                ),
              ),
              const Divider(
                thickness: 2,
                indent: 25,
                endIndent: 200,
                color: Colors.black45,
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                child: SizedBox(
                  width: double.infinity,
                  height: 180,
                  child: FutureBuilder(
                    future: generateCarouselItemFromDB(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else {
                        List<CarouselItem> citems = snapshot.data ?? [];
                        if (citems.isEmpty) {
                          return const CarouselItem(
                            judulBerita: "judulBerita",
                            isiBerita: "isiBerita",
                            imagePath: "assets/images/placeholder.jpg",
                          );
                        } else {
                          return CarouselSlider.builder(
                            itemCount: citems.length,
                            options: CarouselOptions(
                              initialPage: 1,
                              viewportFraction: 0.8,
                              disableCenter: true,
                              enlargeCenterPage: true,
                              enlargeFactor: 0.25,
                              enableInfiniteScroll: true,
                              scrollDirection: Axis.horizontal,
                              autoPlay: true,
                            ),
                            itemBuilder: (context, index, realIndex) {
                              return citems[index];
                            },
                          );
                        }
                      }
                    },
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 17, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                      child: Text(
                        'Berita Hari ini',
                        style: TextStyle(
                          fontFamily: 'Readex',
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                      child: Text(
                        '9 Desember 2023',
                        style: TextStyle(
                          fontFamily: "Readex",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ListView(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: [
                  FutureBuilder(
                    future: generateNewsIconsFromDB(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else {
                        List<NewsCard> newsCards = snapshot.data ?? [];
                        if (newsCards.isEmpty) {
                          return const NewsCard(
                            judulBerita: "Judul",
                            isiBerita: "Isi",
                            imagePath: "assets/image/corgi.jpeg",
                          );
                        } else {
                          return ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: newsCards.length,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return newsCards[index];
                            },
                          );
                        }
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
