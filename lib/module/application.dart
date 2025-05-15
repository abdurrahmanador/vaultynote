import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vaultynote/module/home/view/home_view.dart';
import 'auth/controller/lock_controller.dart';
import 'auth/create_password_page.dart';
import 'auth/lock_screen_page.dart';

class SecureNoteApp extends StatelessWidget {
  const SecureNoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    final LockController controller = Get.put(LockController());
    return GetMaterialApp(  // Ensure GetMaterialApp is at the root
      debugShowCheckedModeBanner: false,
      home: Obx(() {
        if (controller.isLoading.value) {
          return Scaffold(
            backgroundColor: Colors.grey.shade900,
            body: Center(child: CircularProgressIndicator(color: Colors.white)),
          );
        } else {
          return controller.hasPassword.value ? LockScreenPage() : CreatePasswordPage();
        }
      }),
      theme: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
    );
  }
}
