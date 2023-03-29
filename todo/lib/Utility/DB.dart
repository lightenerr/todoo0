import 'dart:async';
import 'Constants.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


class DataB {
  var database;

  initdb() async {
    WidgetsFlutterBinding.ensureInitialized();
    if (database == null)
      return database;
    else
    database = await openDatabase(
      join(await getDatabasesPath(), 'task_database.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE tasks(id INTEGER PRIMARY KEY, Category TEXT , Title TEXT , Description TEXT,Priority INTEGER, Date TEXT)',
        );
      },
      version: 1,
    );
  }

  Future<void> insertItem(TaskL items) async {
    await initdb();
    database.insert(
      'tasks',
      items.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<TaskL>> retrieveT() async {
    final db = await database;

    final List<Map<String, dynamic>> maps = await db.query('tasks');

    return List.generate(maps.length, (i) {
      return TaskL(
        id: maps[i]['id'],
        category: maps[i]['Category'],
        title: maps[i]['Title'],
        description: maps[i]['Description'],
        priority: maps[i]['Priority'],
        date: maps[i]['Date'],
      );
    });
  }

  Future<void> updateList(TaskL dog) async {
    final db = await database;

    await db.update(
      'tasks',
      dog.toMap(),
      where: 'id = ?',
      whereArgs: [dog.id],
    );
  }

  Future<void> deleteitem(int id) async {
    final db = await database;

    await db.delete(
      'tasks',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  var fido = TaskL(
    id: 5,
    category: '5',
    description: 'd',
    title: 'dd',
    date: '4',
    priority: '35',
  );
}
