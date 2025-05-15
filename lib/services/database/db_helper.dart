import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../encrypt/encrypt_helper.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('secureNote.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE notes(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        content TEXT,
        createdAt TEXT
      )
    ''');
  }

  // Insert Note with encryption
  Future<void> insertNote(String title, String content, String createdAt) async {
    final db = await database;
    await db.insert(
      'notes',
      {
        'title': EncryptionHelper.encryptText(title),
        'content': EncryptionHelper.encryptText(content),
        'createdAt': createdAt, // date doesn't need encryption
      },
    );
  }
// Update an existing note with encryption
  Future<void> updateNote(int id, String title, String content) async {
    final db = await database;
    await db.update(
      'notes',
      {
        'title': EncryptionHelper.encryptText(title),
        'content': EncryptionHelper.encryptText(content),
      },
      where: 'id = ?',
      whereArgs: [id],
    );
  }
  // Read Notes with decryption
  Future<List<Map<String, dynamic>>> fetchNotes() async {
    final db = await database;
    final notes = await db.query('notes');
    return notes.map((note) => {
      'id': note['id'],
      'title': EncryptionHelper.decryptText(note['title'] as String),
      'content': EncryptionHelper.decryptText(note['content'] as String),
      'createdAt': note['createdAt'],
    }).toList();
  }
// Delete a note by its ID
  Future<void> deleteNote(int id) async {
    final db = await database;
    await db.delete(
      'notes',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // Emergency Destroyer
  Future<void> deleteAllNotes() async {
    final db = await database;
    await db.delete('notes');
  }
}
