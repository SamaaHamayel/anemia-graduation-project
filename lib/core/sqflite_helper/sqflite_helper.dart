import 'dart:developer';

import 'package:animeacheck/features/home/history/data/history_model.dart';
import 'package:animeacheck/features/home/medicine/domain/medicine_model/medicine_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart'; // استيراد مكتبة path

class SqfliteHelper 
{
  late Database db;

  // Initialize the database
  Future<void> initDB() async {
    String dbPath = await getDatabasesPath();
    String path = join(dbPath, 'medicine.db');

    db = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        // Create Medicine table
        await db.execute('''
        CREATE TABLE Medicine (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name TEXT,
          dose INTEGER,
          shape INTEGER,
          startTime TEXT)
      ''');
        // Create History table
        await db.execute('''
        CREATE TABLE History (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          date TEXT,
          result TEXT)
      ''');
      },
      onOpen: (db) => log('Database opened'),
    );
  }

  // Insert MedicineModel into the database
  Future<int> insertMedicine({required MedicineModel model}) async {
    return await db.rawInsert('''
    INSERT INTO Medicine(name, dose, shape, startTime)
    VALUES(?, ?, ?, ?)''', [
      model.medicineName,
      model.medicineDose,
      model.medicineShape,
      model.startTime,
    ]);
  }

  // Insert HistoryModel into the database

  Future<int> insertHistory({required HistoryModel model}) async {
    return await db.rawInsert('''
    INSERT INTO History(id,image,date, result)
    VALUES(?, ?, ?, ?)''', [
      model.date,
      model.result,
      model.id,
    ]);
  }

  // Get all Medicine records from the database
  Future<List<Map<String, dynamic>>> getMedicinesFromDB() async {
    return await db.rawQuery('SELECT * FROM Medicine');
  }

  // Get all History records from the database
  Future<List<Map<String, dynamic>>> getHistoryFromDB() async {
    return await db.rawQuery('SELECT * FROM History');
  }

  // Update Medicine record in the database
  Future<int> editMedicineFromDB(int id) async {
    return await db.rawUpdate('''
    UPDATE Medicine
    SET isEditing = ?
    WHERE id = ?
   ''', [1, id]);
  }

  // Delete Medicine record from the database
  Future<int> deleteMedicine(int id) async {
    return await db.rawDelete(
      '''DELETE FROM Medicine WHERE id = ?''',
      [id],
    );
  }

  // Delete History record from the database
  Future<int> deleteHistory(int id) async {
    return await db.rawDelete(
      '''DELETE FROM History WHERE id = ?''',
      [id],
    );
  }
}
