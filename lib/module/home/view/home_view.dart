import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../services/database/db_helper.dart';
import 'note_editor_view.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<Map<String, dynamic>> notes = [];

  void loadNotes() async {
    final data = await DatabaseHelper.instance.fetchNotes();
    setState(() {
      notes = data;
    });
  }

  void deleteNote(int id) async {
    final db = await DatabaseHelper.instance.database;
    await db.delete('notes', where: 'id = ?', whereArgs: [id]);
    loadNotes();
  }

  @override
  void initState() {
    super.initState();
    loadNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        title: Text('SecureNote+'),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () async {
              await Get.to(() => AddNoteView());
              loadNotes(); // refresh after coming back
            },
          ),
        ],
      ),
      body: notes.isEmpty
          ? Center(
        child: Text('No Notes yet', style: TextStyle(color: Colors.white54)),
      )
          : ListView.builder(
        itemCount: notes.length,
        itemBuilder: (context, index) {
          final note = notes[index];
          return Dismissible(
            key: Key(note['id'].toString()),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {
              deleteNote(note['id']);
            },
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(right: 20),
              child: Icon(Icons.delete, color: Colors.white),
            ),
            child: Card(
              color: Colors.white10,
              child: ListTile(
                title: Text(note['title'], style: TextStyle(color: Colors.white)),
                subtitle: Text(
                  note['content'],
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.white54),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
