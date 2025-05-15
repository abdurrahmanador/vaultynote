import 'package:get/get.dart';
import 'package:vaultynote/services/database/db_helper.dart';

class PanicButtonController extends GetxController {
  // Emergency destroyer function to delete all notes
  Future<void> emergencyDestroy() async {
    try {
      await DatabaseHelper.instance.deleteAllNotes();  // Delete all notes from the database
      print("All data destroyed successfully!");
    } catch (e) {
      print("Error during emergency destroy: $e");
    }
  }

  // Panic button method
  void triggerPanicButton() {
    emergencyDestroy();
  }
}
