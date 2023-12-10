import 'package:flutter/material.dart';
import '../sqlite_handler.dart';
import 'package:sqflite/sqflite.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  Future<List<NewsCard>> generateNewsIconsFromDB() async {
    Database db = await SqliteHandler().openDB();
    List<Map<String, dynamic>> rows = await db.query('landing_kampos');
    final dataList = await db
        .rawQuery('SELECT judul,SUBSTR(isi,1,30) AS isi FROM landing_kampos');

    return List.generate(
      rows.length,
      (index) => NewsCard(
          judulBerita: dataList[index]["judul"] as String,
          isiBerita: dataList[index]["isi"] as String),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: scaffoldKey,
      backgroundColor: const Color.fromARGB(255, 241, 244, 248),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 75, 57, 239),
        automaticallyImplyLeading: false,
        title: const Text(
          'Kampos.com',
          style: TextStyle(
            color: Colors.white,
            fontFamily: "Readex",
            fontSize: 22,
          ),
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
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                      print(snapshot);
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

class NewsCard extends StatelessWidget {
  final String judulBerita;
  final String isiBerita;
  const NewsCard(
      {super.key, required this.judulBerita, required this.isiBerita});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(6, 10, 6, 0),
      child: Card(
        // Ini dynamic sesuai banyak isi data nya bang....
        clipBehavior: Clip.antiAliasWithSaveLayer,
        color: Colors.white,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(0),
                child: Image.network(
                  'https://picsum.photos/seed/526/600',
                  width: 140,
                  height: 140,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(7, 16, 0, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
                      child: Text(
                        judulBerita,
                        style: const TextStyle(
                          fontFamily: 'Readex',
                          fontSize: 16,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    Text(
                      isiBerita,
                      style: const TextStyle(
                        fontFamily: 'Readex',
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
