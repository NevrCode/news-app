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

  Future<int> getID() async {
    Database db = await SqliteHandler().openDB();
    final length =
        await db.rawQuery("SELECT COUNT(*) AS row_count FROM komentar_kampos");
    return length[0]["row_count"] as int;
  }

  Future<Map<String, String>> toDBMap() async {
    return {
      "_id": (await getID() + 1).toString(),
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
