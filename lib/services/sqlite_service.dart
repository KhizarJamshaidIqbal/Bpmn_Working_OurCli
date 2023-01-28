// ignore_for_file: unused_local_variable

import 'package:bpm/Model/sugercalmodel.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqliteService {
  static Future<Database> initializeDB() async {
    String path = await getDatabasesPath();

    return openDatabase(
      join(path, 'database.db'),
      onCreate: (database, version) async {
        await database.execute(
          "CREATE TABLE SugerCalculatTable(id INTEGER PRIMARY KEY AUTOINCREMENT,sysTolic INTEGER NOT NULL,diasTolic INTEGER NOT NULL,pulse INTEGER NOT NULL,date TEXT NOT NULL,time TEXT NOT NULL)",
        );
      },
      version: 1,
    );
  }

  static Future<int> createItem(SugerCalculateModel sobj) async {
    int result = 0;
    final Database db = await initializeDB();
    final id = await db.insert('SugerCalculatTable', sobj.tomap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    return id;
  }

  static Future<int> updateItem(SugerCalculateModel sobj, String id) async {
    int result = 0;
    final Database db = await initializeDB();
    final id = await db.update('SugerCalculatTable', sobj.tomap(),
        where: 'id = ${sobj.id}');
    return id;
  }

  static Future<List<SugerCalculateModel>> getItems() async {
    final db = await initializeDB();
    final List<Map<String, Object?>> queryResult =
        await db.query('SugerCalculatTable', orderBy: 'id');
    // print("");
    // for (var item in queryResult) {
    //   print(item);
    // }
    return queryResult.map((e) => SugerCalculateModel.fromMap(e)).toList();
  }

  static Future<void> deleteItem(String id) async {
    final db = await initializeDB();
    try {
      await db.delete("SugerCalculatTable", where: "id = ?", whereArgs: [id]);
    } catch (err) {
      debugPrint("Something went wrong when deleting an item: $err");
    }
  }
}
