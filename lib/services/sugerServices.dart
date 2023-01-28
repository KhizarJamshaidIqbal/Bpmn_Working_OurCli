// ignore_for_file: file_names, unused_local_variable

import 'package:bpm/Model/sugermodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SugerServices {
  static Future<Database> initializeDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'database2.db'),
      onCreate: (database, version) async {
        await database.execute(
          "CREATE TABLE SugerrecordTable(id INTEGER PRIMARY KEY AUTOINCREMENT,sateName TEXT NOT NULL,mgddl INTEGER NOT NULL,date TEXT NOT NULL,time TEXT NOT NULL)",
        );
      },
      version: 1,
    );
  }

  static Future<int> createItem(SugerModel sobj) async {
    int result = 0;
    final Database db = await initializeDB();
    final id = await db.insert('SugerrecordTable', sobj.tomap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    return id;
  }

  static Future<int> updateItem(SugerModel sobj, String id) async {
    int result = 0;
    final Database db = await initializeDB();
    final id = await db.update('SugerrecordTable', sobj.tomap(),
        where: 'id = ${sobj.id}');
    return id;
  }

  static Future<List<SugerModel>> getItems() async {
    final db = await initializeDB();
    final List<Map<String, Object?>> queryResult =
        await db.query('SugerrecordTable', orderBy: 'id');
    return queryResult.map((e) => SugerModel.fromMap(e)).toList();
  }

  static Future<void> deleteItem(String id) async {
    final db = await initializeDB();
    try {
      await db.delete("SugerrecordTable", where: "id = ?", whereArgs: [id]);
    } catch (err) {
      debugPrint("Something went wrong when deleting an item: $err");
    }
  }
}
