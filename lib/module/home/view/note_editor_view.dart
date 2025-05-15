import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../services/database/db_helper.dart';

class AddNoteView extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  void saveNote() async {
    final title = titleController.text.trim();
    final content = contentController.text.trim();
    final createdAt = DateTime.now().toIso8601String();

    if (title.isNotEmpty && content.isNotEmpty) {
      await DatabaseHelper.instance.insertNote(title, content, createdAt);
      Get.back(); // go back after saving
    } else {
      Get.snackbar('Error', 'Title and Content cannot be empty!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        title: Text('Add Note'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                hintText: 'Title',
                filled: true,
                fillColor: Colors.white10,
                hintStyle: TextStyle(color: Colors.white54),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 20),
            Expanded(
              child: TextField(
                controller: contentController,
                maxLines: null,
                expands: true,
                decoration: InputDecoration(
                  hintText: 'Write your note...',
                  filled: true,
                  fillColor: Colors.white10,
                  hintStyle: TextStyle(color: Colors.white54),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: saveNote,
              child: Text('Save Note'),
            )
          ],
        ),
      ),
    );
  }
}
