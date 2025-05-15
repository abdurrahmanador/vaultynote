import 'package:get/get.dart';
import 'package:vaultynote/services/database/db_helper.dart';
import 'package:vaultynote/services/database/model/note.dart';

class NoteController extends GetxController {
  var notes = <Note>[].obs;
  var isLoading = false.obs;  // For managing loading state

  @override
  void onInit() {
    super.onInit();
    loadNotes();
  }

  // Load notes from the database
  Future<void> loadNotes() async {
    try {
      isLoading.value = true;
      final dataList = await DatabaseHelper.instance.fetchNotes();
      notes.value = dataList.map((e) => Note.fromMap(e)).toList();
    } catch (e) {
      Get.snackbar('Error', 'Failed to load notes');
    } finally {
      isLoading.value = false;
    }
  }

  // Add a new note
  Future<void> addNote(Note note) async {
    try {
      isLoading.value = true;
      await DatabaseHelper.instance.insertNote(note.title, note.content, note.createdAt);
      await loadNotes();
    } catch (e) {
      Get.snackbar('Error', 'Failed to add note');
    } finally {
      isLoading.value = false;
    }
  }

  // Update an existing note
  Future<void> updateNote(Note note) async {
    try {
      isLoading.value = true;
      await DatabaseHelper.instance.updateNote(note.id, note.title, note.content);
      await loadNotes();
    } catch (e) {
      Get.snackbar('Error', 'Failed to update note');
    } finally {
      isLoading.value = false;
    }
  }

  // Delete a note
  Future<void> deleteNote(int id) async {
    try {
      isLoading.value = true;
      await DatabaseHelper.instance.deleteNote(id);
      await loadNotes();
    } catch (e) {
      Get.snackbar('Error', 'Failed to delete note');
    } finally {
      isLoading.value = false;
    }
  }
}
