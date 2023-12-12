import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/costum/news_comment.dart';
import 'package:news_app/sqlite_handler.dart';
import 'package:sqflite/sqflite.dart';

class DetailPage extends StatefulWidget {
  final String judul;
  final String isi;
  final String image;
  final String newsID;
  final String tgl;
  final String sub;
  const DetailPage({
    super.key,
    required this.judul,
    required this.sub,
    required this.isi,
    required this.image,
    required this.newsID,
    required this.tgl,
  });

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  Future<List<Comment>> generateCommentSection() async {
    Database db = await SqliteHandler().openDB();
    final dataList = await db
        .rawQuery("SELECT * FROM komentar_kampos WHERE tempat_komen = 1");
    print("datalist : $dataList");
    return List.generate(
        dataList.length,
        (index) => Comment(
              commenter: dataList[index]["pengkomen"] as String,
              time: dataList[index]["tanggal_komen"] as String,
              comment: dataList[index]["isi_komen"] as String,
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: const Color.fromARGB(255, 241, 244, 248),
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.chevron_left_rounded,
            color: Color.fromARGB(255, 20, 24, 27),
            size: 32,
          ),
        ),
        title: Text(
          widget.judul,
          style: const TextStyle(
            color: Color.fromARGB(255, 20, 24, 27),
            fontFamily: "Nunito",
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        actions: const [],
        centerTitle: false,
        elevation: 0,
      ),
      body: SafeArea(
        top: true,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListView(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: Image.asset(
                                widget.image,
                                width: 751,
                                height: 180,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  20, 16, 0, 0),
                              child: Text(
                                widget.sub,
                                style: const TextStyle(
                                  fontFamily: 'Readex',
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  20, 8, 0, 0),
                              child: Text(
                                widget.tgl,
                                // widget.tgl,
                                style: const TextStyle(
                                  fontFamily: 'Readex',
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 75, 57, 239),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  20, 12, 20, 4),
                              child: Text(
                                widget.isi,
                                style: const TextStyle(
                                    fontFamily: "Readex",
                                    fontSize: 16,
                                    color: Color.fromARGB(255, 87, 99, 108)),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Divider(
                      height: 24,
                      thickness: 2,
                      indent: 20,
                      endIndent: 20,
                      color: Color.fromARGB(255, 224, 227, 231),
                    ),
                    const Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 12),
                          child: Text('99+ Comments..',
                              style: TextStyle(
                                  fontFamily: "Readex",
                                  fontSize: 14,
                                  color: Color.fromARGB(255, 87, 99, 108))),
                        ),
                      ],
                    ),
                    ListView(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      children: [
                        FutureBuilder(
                            future: generateCommentSection(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const CircularProgressIndicator();
                              } else {
                                print("snapshot : ${snapshot.data}");
                                List<Comment> comments = snapshot.data ?? [];
                                print("list : $comments");
                                if (comments.isEmpty) {
                                  return Comment(
                                    commenter: "orang baik",
                                    time: DateFormat("dd MMMM yyyy")
                                        .format(DateTime.now()),
                                    comment:
                                        "weew dia sangat jahat , hikz hikz...",
                                  );
                                } else if (snapshot.hasError) {
                                  return Text('Error: ${snapshot.error}');
                                } else {
                                  return ListView.builder(
                                      itemCount: comments.length,
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) {
                                        return Comment(
                                          commenter: comments[index].commenter,
                                          time: comments[index].time,
                                          comment: comments[index].comment,
                                        );
                                      });
                                }
                              }
                            })
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
