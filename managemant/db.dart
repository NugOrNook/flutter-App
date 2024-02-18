import 'package:async/async.dart';
import 'package:path/path.dart' show join;
import 'package:sqflite/sqflite.dart';

class SqliteManame {
  final String _dbname = "Vongola.db"; //กำหนดชื่อ database
  final int _dbversion = 1;

  //กำหนดคำสั่งที่ใช้สร้าง database
  final String _createSQL = "CREATE TABLE TypeFinancial("
      "ID_type_financial INTEGER(5) PRIMARY KEY,"
      "type_financial Varchar(20)"
      ");"
      "CREATE TABLE Financial("
      "ID_financial INTEGER(15) PRIMARY KEY AUTOINCREMENT,"
      "date_user DATETIME,"
      "amount_financial DECIMAL(30),"
      "type_expense BOOLEAN,"
      "ID_type_financial INTEGER(5),"
      "memo_financial TEXT,"
      "FOREIGN KEY (ID_type_financial) REFERENCES TypeFinancial(ID_type_financial)"
      ");"
      "CREATE TABLE Budget("
      "ID_budget INTEGER(12) PRIMARY KEY AUTOINCREMENT,"
      "capital_budget DECIMAL(30),"
      "ID_type_financial INTEGER(5),"
      "date_start DATETIME,"
      "date_end DATETIME,"
      "FOREIGN KEY (ID_type_financial) REFERENCES TypeFinancial(ID_type_financial)"
      ")";

  late String createSqlCommand;
  late String databasePath;
  late String dbPath;
  late Database _database;

  //ฟังก์ชันเพื่อเปิดหรือสร้าง database โดยใช้ Path จาก dbPath
  // async คือสามารถรันตัวอื่นได้ก่อนเลยไม่ต้องรอฟังก์ชันนี้
  void openOrCreateDatabase() async {
    createSqlCommand = _createSQL;
    databasePath = await getDatabasesPath();
    dbPath = join(databasePath, _dbname);
    _database = await openDatabase(dbPath,
        version: _dbversion, onCreate: createDatabase);
    //ทำการเปิด database หากเปิดไม่เจอจะไปทำการสร้าง database ที่ฟังก์ชัน createDatabase ด้านล่าง
  }

  //ฟังก์ชัสำหรับสร้าง database
  Future<void> createDatabase(Database db, int version) async {
    if (createSqlCommand != "") {
      await db.execute(createSqlCommand);
    }
  }

  Future<List<Map<String, dynamic>>> queryDatabase(String sqlString) async {
    createSqlCommand = _createSQL;
    databasePath = await getDatabasesPath();
    dbPath = join(databasePath, _dbname);
    _database = await openDatabase(dbPath,
        version: _dbversion, onCreate: createDatabase);
    return await _database.rawQuery(sqlString);
  }

  Future<int> insertDatabase(String sqlString) async {
    createSqlCommand = _createSQL;
    databasePath = await getDatabasesPath();
    dbPath = join(databasePath, _dbname);
    _database = await openDatabase(dbPath,
        version: _dbversion, onCreate: createDatabase);
    return await _database.rawInsert(sqlString);
  }

  Future<int> updateDatabase(String sqlString) async {
    createSqlCommand = _createSQL;
    databasePath = await getDatabasesPath();
    dbPath = join(databasePath, _dbname);
    _database = await openDatabase(dbPath,
        version: _dbversion, onCreate: createDatabase);
    return await _database.rawUpdate(sqlString);
  }

  Future<int> deleteDatabase(String sqlString) async {
    createSqlCommand = _createSQL;
    databasePath = await getDatabasesPath();
    dbPath = join(databasePath, _dbname);
    _database = await openDatabase(dbPath,
        version: _dbversion, onCreate: createDatabase);
    return await _database.rawDelete(sqlString);
  }

  void closeDatabase() async {
    createSqlCommand = _createSQL;
    databasePath = await getDatabasesPath();
    dbPath = join(databasePath, _dbname);
    _database = await openDatabase(dbPath,
        version: _dbversion, onCreate: createDatabase);
    await _database.close();
  }
}
