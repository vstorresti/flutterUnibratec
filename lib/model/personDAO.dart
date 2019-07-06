import 'package:flutter_app_vtorres/services/helper.dart';
import 'person.dart';
import 'package:sqflite/sqflite.dart';

class PersonDAO {
  Future<List<Person>> get() async {
    Database db = await DBHelper().database;

    final List<Map<String, dynamic>> maps = await db.query('person');
    var people = List.generate(maps.length, (i) {
      return Person.fromJson(maps[i]);
    });
    return people;
  }

  Future<void> insert({Person person}) async {
    Database db = await DBHelper().database;

    await db.insert('person', person.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> update(Person person) async {
    Database db = await DBHelper().database;

    await db.update('person', person.toJson(),
        where: "id = ?", whereArgs: [person.id]);
  }

  Future<void> delete(int id) async {
    Database db = await DBHelper().database;

    await db.delete('person', where: "id = ?", whereArgs: [id]);
  }
}
