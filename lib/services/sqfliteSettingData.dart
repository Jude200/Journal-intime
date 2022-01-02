import 'package:flutter_flu/models/appData.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqfLiteSettingData {
  Database settingDataBase;
  String settingtable = "settingData";

  Future<void> open() async {
    String databasepath = await getDatabasesPath();
    String path = join(databasepath, 'settingData.db');

    settingDataBase = await openDatabase(path, version: 1,
        onCreate: (Database dataBaseAppData, int version) async {
      await dataBaseAppData.execute('''create table settingData (
            id integer primary key autoincrement,
            darkMode integer not null,
            police text,
            islock integer not null,
            password text,
            passwordIndicator text
          ) ''');
    });
  }

  Future<AppData> insert(AppData appData) async {
    await open();
    appData.id = await settingDataBase.insert(settingtable, appData.toMap());
    return appData;
  }

  Future<AppData> getData(int id) async {
    await open();
    List<Map<String, dynamic>> maps = await settingDataBase.query(
      settingtable,
      where: 'id = ?',
      whereArgs: [id],
    );
    int l = maps?.length ?? 0;
    if (l > 0) {
      return AppData.fromMap(maps.first);
    }
    return null;
  }

  Future<int> update(AppData appData) async {
    await open();
    int a = await settingDataBase.update(
      settingtable,
      appData.toMap(),
      where: 'id = ?',
      whereArgs: [appData.id],
    );
    await close();
    return a;
  }

  Future<List<AppData>> getAllDiary() async {
    await open();
    List<Map<String, dynamic>> maps = await settingDataBase.query(settingtable);
    return maps.map((diaryMap) => AppData.fromMap(diaryMap)).toList();
  }

  Future<int> delete(int id) async {
    await open();
    int a = await settingDataBase
        .delete(settingtable, where: 'id = ?', whereArgs: [id]);
    return a;
  }

  Future<void> close() async => settingDataBase.close();
}
