import 'package:flutter_flu/models/diary.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqfLiteDiaryData {
  Database dataBaseDiary;
  String tdiaryData = "diaryData";

  Future<void> open() async {
    String databasepath = await getDatabasesPath();
    String path = join(databasepath, 'data.db');

    dataBaseDiary = await openDatabase(path, version: 1,
        onCreate: (Database dataBaseDiary, int version) async {
      await dataBaseDiary.execute('''create table diaryData (
            id integer primary key autoincrement,
            titre text not null,
            body text not null,
            date text not  null,
            image text not null
          ) ''');
    });
  }

  Future<Diary> insert(Diary diary) async {
    await open();
    diary.id = await dataBaseDiary.insert(tdiaryData, diary.toMap());
    return diary;
  }

  Future<Diary> getContact(int id) async {
    await open();
    List<Map<String, dynamic>> maps = await dataBaseDiary.query(
      tdiaryData,
      where: 'id = ?',
      whereArgs: [id],
    );
    int l = maps?.length ?? 0;
    if (l > 0) {
      return Diary.fromMap(maps.first);
    }
    return null;
  }

  Future<List<Diary>> getAllContact() async {
    await open();
    List<Map<String, dynamic>> maps = await dataBaseDiary?.query(tdiaryData);
    return maps.map((diaryMap) => Diary.fromMap(diaryMap)).toList();
  }

  Future<int> delete(int id) async {
    await open();
    int a = await dataBaseDiary
        .delete(tdiaryData, where: 'id = ?', whereArgs: [id]);
    return a;
  }

  Future<int> update(Diary diary) async {
    await open();
    int a = await dataBaseDiary.update(
      tdiaryData,
      diary.toMap(),
      where: 'id = ?',
      whereArgs: [diary.id],
    );
    return a;
  }

  Future<void> close() async => dataBaseDiary.close();
}
