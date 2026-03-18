import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:task_manager_app/features/task/data/model/task_model.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();

  const tableName = 'tasks';

  final database =
      openDatabase(join(await getDatabasesPath(), tableName),
          onCreate: (db, version) {
    return db.execute(
        'CREATE TABLE TASKS(id STRING PRIMARY KEY, title TEXT, isCompleted INTEGER, createdAt TEXT)');
  }, version: 1);

  Future<void> insertTask(TaskModel task) async {
    final db = await database;

    await db.insert(tableName, task.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> updateTask(TaskModel task) async {
    final db = await database;

    await db.update(tableName, task.toMap(),
        where: 'id = ?', whereArgs: [task.id]);
  }

  Future<void> deleteTask(String id) async {
    final db = await database;

    await db.delete(tableName, where: 'id = ?', whereArgs: [id]);
  }
}
