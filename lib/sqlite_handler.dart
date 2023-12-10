import 'package:path/path.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'dart:io';

class SqliteHandler {
  Future<Database> openDB() async {
    String singleDBPath =
        join(dirname(Platform.script.toFilePath()), 'db', 'news.db');
    Database db = await openDatabase(singleDBPath);

    return db;
  }
}
