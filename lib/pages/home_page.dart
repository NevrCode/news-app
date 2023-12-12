import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/pages/detail_news.dart';
import 'package:news_app/pages/profile.dart';
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
  var notif = Icons.notifications_none;
  Future<List<NewsCard>> generateNewsIconsFromDB() async {
    Database db = await SqliteHandler().openDB();
    final dataList = await db.rawQuery(
        'SELECT judul,SUBSTR(isi_berita,3,36) AS isi, icon_image_path, _id, subjudul, tanggal FROM detail_kampos');

    return List.generate(
      dataList.length,
      (index) => NewsCard(
        judulBerita: dataList[index]["judul"] as String,
        isiBerita: dataList[index]["isi"] as String,
        imagePath: dataList[index]["icon_image_path"] as String,
        newsID: dataList[index]["_id"] as String,
        tgl: dataList[index]["tanggal"] as String,
        sub: dataList[index]["subjudul"] as String,
      ),
    );
  }

  Future<List<CarouselItem>> generateCarouselItemFromDB() async {
    Database db = await SqliteHandler().openDB();
    final dataList = await db.rawQuery(
        'SELECT judul,SUBSTR(isi_berita,3,36) AS isi, carousel_image_path, _id, subjudul, tanggal FROM detail_kampos');

    return List.generate(
      dataList.length,
      (index) => CarouselItem(
        judulBerita: dataList[index]["judul"] as String,
        isiBerita: dataList[index]["isi"] as String,
        imagePath: dataList[index]["carousel_image_path"] as String,
        newsID: dataList[index]["_id"] as String,
        tanggal: dataList[index]['tanggal'] as String,
        sub: dataList[index]['subjudul'] as String,
      ),
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
            Padding(
              padding: EdgeInsets.only(top: 3.0),
              child: Text(
                '.com',
                style: TextStyle(
                  color: Color.fromARGB(255, 201, 94, 94),
                  fontFamily: "Readex",
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(notif),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
              const Color.fromARGB(255, 241, 244, 248),
            )),
            onPressed: () {
              setState(() {
                notif = (notif == Icons.notifications_active
                    ? Icons.notifications_none
                    : Icons.notifications_active);
              });
            },
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
            child: IconButton(
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.all(const Size(40, 40)),
                backgroundColor: MaterialStateProperty.all(
                  const Color.fromARGB(255, 241, 244, 248),
                ),
              ),
              icon: const Icon(
                Icons.person_outline_sharp,
                size: 24,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProfilePage()));
              },
            ),
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
                          return CarouselItem(
                            judulBerita: "judulBerita",
                            isiBerita: "isiBerita",
                            imagePath: "assets/images/placeholder.jpg",
                            newsID: "asd",
                            tanggal: DateFormat("dd MMMM yyyy")
                                .format(DateTime.now()),
                            sub: "Sub Judul",
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
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailPage(
                                        judul: citems[index].judulBerita,
                                        image: citems[index].imagePath,
                                        isi: citems[index].isiBerita,
                                        newsID: citems[index].newsID,
                                        tgl: citems[index].tanggal,
                                        sub: citems[index].sub,
                                      ),
                                    ),
                                  );
                                },
                                child: citems[index],
                              );
                            },
                          );
                        }
                      }
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 17, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
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
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                      child: Text(
                        DateFormat("dd MMMM yyyy").format(DateTime.now()),
                        style: const TextStyle(
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
                          return NewsCard(
                            judulBerita: "Judul",
                            isiBerita: "Isi",
                            imagePath: "assets/image/corgi.jpeg",
                            newsID: "asd",
                            tgl: DateFormat("dd MMMM yyyy")
                                .format(DateTime.now()),
                            sub: "SubJudul",
                          );
                        } else {
                          return ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: newsCards.length,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => DetailPage(
                                          judul: newsCards[index].judulBerita,
                                          image: newsCards[index].imagePath,
                                          isi: newsCards[index].isiBerita,
                                          newsID: newsCards[index].newsID,
                                          tgl: newsCards[index].tgl,
                                          sub: newsCards[index].sub,
                                        ),
                                      ));
                                },
                                child: newsCards[index],
                              );
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
