import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart' as sql;

class FavSQLHelper {
  static Future<void> createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE favourites(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        movieid INTEGER,
        moviename Text,
        image Text,

        createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
      )
      """);
  }
// id: the id of a item
// title, description: name and description of your activity
// created_at: the time that the item was created. It will be automatically handled by SQLite

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'favourites.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }

  // Create new item (journal)
  static Future<int> createItem(
      int? movieid, String moviename, String image) async {
    final db = await FavSQLHelper.db();

    final data = {
      'movieid': movieid,
    };
    final id = await db.insert('favourites', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  // Read all items (journals)
  static Future<List<Map<String, dynamic>>> getItems(
      int id, String moviename, String image) async {
    final db = await FavSQLHelper.db();
    return db.query('favourites', orderBy: "id");
  }

  // Read a single item by id
  // The app doesn't use this method but I put here in case you want to see it
  static Future<List<Map<String, dynamic>>> getItem(int movieid) async {
    final db = await FavSQLHelper.db();
    return db.query('favourites',
        where: "movieid = ?", whereArgs: [movieid], limit: 1);
  }

  // Update an item by id
  // static Future<int> updateItem(
  //     int id, int movieid) async {
  //   final db = await SQLHelper.db();

  //   final data = {
  //     'movieid':movieid,
  //     'createdAt': DateTime.now().toString()
  //   };

  //   final result =
  //       await db.update('favourites', data, where: "id = ?", whereArgs: [id]);
  //   return result;
  // }

  // Delete
  static Future<void> deleteItem(int id) async {
    final db = await FavSQLHelper.db();
    try {
      await db.delete("favourites", where: "movieid = ?", whereArgs: [id]);
    } catch (err) {
      debugPrint("Something went wrong when deleting an item: $err");
    }
  }
}
