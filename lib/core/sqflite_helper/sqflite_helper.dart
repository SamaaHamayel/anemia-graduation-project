import 'package:animeacheck/features/home/medicine/domain/medicine_model/medicine_model.dart';
import 'package:sqflite/sqflite.dart';

class SqfliteHelper {
  late Database db;
  //1. create DB
  //2.create table
  //3.CRUD => create - read - update - delete

  //! initDatabase
  void intiDB() async {
    //step 1 => Create database
    db = await openDatabase(
      'medicine.db',
      version: 1,
      onCreate: (Database db, int v) async {
        //step 2 => create table
        return await db.execute('''
        CREATE TABLE Medicine (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        dose INTEGER,
        shape INTEGER,
        startTime TEXT)
      ''').then(
          (value) => print('DB created successfully'),
        );
      },
      onOpen: (db) => print('Database opened'),
    ).then((value) => db = value);
  }

  //! insert
  Future<int> insertToDB({required MedicineModel model}) async {
    return await db.rawInsert('''
    INSERT INTO Medicine(name, dose, shape, startTime)
    VALUES(?, ?, ?, ?)''', [
      model.medicineName,
      model.medicineDose,
      model.medicineShape,
      model.startTime,
    ]);
  }

  //!get
  Future<List<Map<String, dynamic>>> getFromDB() async {
    return await db.rawQuery('SELECT * FROM Medicine');
  }

  //! update
  Future<int> updatedDB(int id) async {
    return await db.rawUpdate('''
    UPDATE Medicine
    SET isCompleted = ?
    WHERE id = ?
   ''', [1, id]);
  }

  //! delete
  Future<int> deleteFromDB(int id) async {
    return await db.rawDelete(
      '''DELETE FROM Medicine WHERE id = ?''',
      [id],
    );
  }
}
