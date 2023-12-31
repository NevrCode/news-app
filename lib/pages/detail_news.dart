import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/constants/body_text.dart';
import 'package:news_app/costum/news_comment.dart';
import 'package:news_app/model/comment_inputfield.dart';
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
  bool s = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController namaController = TextEditingController();
  TextEditingController komentarController = TextEditingController();

  Future<List<Comment>> generateCommentSection() async {
    Database db = await SqliteHandler().openDB();
    final dataList = await db.rawQuery(
        "SELECT * FROM komentar_kampos WHERE tempat_komen = ${widget.newsID}");
    print("datalist : $dataList");
    return List.generate(
        dataList.length,
        (index) => Comment(
              commenter: dataList[index]["pengkomen"] as String,
              time: dataList[index]["tanggal_komen"] as String,
              comment: dataList[index]["isi_komen"] as String,
            ));
  }

  String makeDate() {
    List<String> components = widget.tgl.split("-");

    int day = int.parse(components[0]);
    int month = int.parse(components[1]);
    int year = 2000 + int.parse(components[2]);

    final dateFormat = DateFormat("dd MMMM yyyy");

    return dateFormat.format(DateTime(year, month, day));
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
                                makeDate(),

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
                          child: Text('10+ Comments..',
                              style: TextStyle(
                                  fontFamily: "Readex",
                                  fontSize: 14,
                                  color: Color.fromARGB(255, 87, 99, 108))),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 24),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 5,
                              color: Color(0x162D3A21),
                              offset: Offset(0, 3),
                            )
                          ],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  12, 12, 12, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              4, 0, 0, 0),
                                      child: Column(
                                        children: [
                                          TextFormField(
                                            controller: namaController,
                                            obscureText: false,
                                            decoration: nameInputstyle,
                                            style: hintstyle,
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 8.0),
                                            child: TextFormField(
                                              controller: komentarController,
                                              obscureText: false,
                                              decoration: commentInputstyle,
                                              style: hintstyle,
                                              maxLines: 8,
                                              minLines: 3,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Divider(
                              height: 12,
                              thickness: 2,
                              color: Color.fromARGB(255, 243, 243, 243),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  12, 4, 12, 12),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  ElevatedButton(
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  const Color.fromARGB(
                                                      255, 201, 94, 94))),
                                      onPressed: () {
                                        CommentInput(
                                          idBerita: widget.newsID,
                                          nama: namaController.text,
                                          komentar: komentarController.text,
                                        ).insertDB();
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            backgroundColor: Color.fromARGB(
                                                255, 0, 230, 118),
                                            content: Text(
                                                'Upload Komentar Berhasil'),
                                          ),
                                        );
                                        setState(() {
                                          namaController.text = "";
                                          komentarController.text = "";
                                          s = !s;
                                        });
                                      },
                                      child: const Text(
                                        "Submit",
                                        style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 255, 255, 255),
                                          fontFamily: "Readex",
                                          fontSize: 12,
                                        ),
                                      ))
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
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
                                List<Comment> comments = snapshot.data ?? [];
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
