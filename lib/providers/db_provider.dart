import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_reader_app/models/scan_model.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {

  static Database? _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  get database async {
    if (_database != null) return _database;

    _database = await initDB();
    return _database;
  }

  Future<Database> initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'ScansDB.db');

    return await openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute('''
        CREATE TABLE Scans(
          id INTEGER PRIMARY KEY,
          tipo TEXT,
          valor TEXT
        );
      ''');
    });
  }

  Future<int> nuevoScan(ScanModel nuevoScan) async {
    final db = await database;
    final rs = await db.insert('Scans', nuevoScan.toJson());
    return rs;
  }

  Future<int> editarScan(ScanModel editarScan) async {
    final db = await database;
    final rs = await db.update('Scans', editarScan.toJson(), where: 'id = ?', whereArgs: [editarScan.id]);
    return rs;
  }

  Future<int> eliminarScan(int id) async {
    final db = await database;
    final rs = db.delete('Scans', where: 'id = ?', whereArgs: [id]);
    return rs;
  }

  Future<int> eliminarAllScans() async {
    final db = await database;
    final rs = db.delete('Scans');
    return rs;
  }

  Future<ScanModel?> getScanById(int id) async {
    final db = await database;
    final rs = await db.query('Scans', where: 'id = ?', whereArgs: [id]);

    return rs.isNotEmpty
      ? ScanModel.fromJson(rs.first)
      : null;
  }

  Future<List<ScanModel>> getScanByTipo(String tipo) async {
    final db = await database;
    final rs = await db.query('Scans', where: 'tipo = ?', whereArgs: [tipo]);

    return rs.isNotEmpty
      ? rs.map<ScanModel>((scan) => ScanModel.fromJson(scan)).toList()
      : [];
  }

  Future<List<ScanModel>> getAllScans() async {
    final db = await database;
    final rs = await db.query('Scans');

    return rs.isNotEmpty
      ? rs.map((scan) => ScanModel.fromJson(scan)).toList()
      : [];
  }
  
}
