import 'package:intl/intl.dart';
import 'package:news_app/sqlite_handler.dart';
import 'package:sqflite/sqflite.dart';

class CommentInput {
  String date = DateFormat("dd MMMM yyyy").format(DateTime.now());
  String y = DateTime.now().second.toString();
  final String idBerita;
  final String nama;
  final String komentar;
  CommentInput({
    required this.idBerita,
    required this.nama,
    required this.komentar,
  });

  String generateId() {
    return "c$y";
  }

  Future<Map<String, String>> toDBMap() async {
    return {
      "_id": generateId(),
      "pengkomen": nama,
      "tanggal_komen": date,
      "isi_komen": komentar,
      "tempat_komen": idBerita,
    };
  }

  Future<void> insertDB() async {
    Database db = await SqliteHandler().openDB();
    await db.insert(
      "komentar_kampos",
      await toDBMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
