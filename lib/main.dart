import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shake/shake.dart';

import 'module/application.dart';
import 'module/auth/controller/panic_button_controller.dart';

void main() {
  Get.put(PanicButtonController()); // This will make it available throughout the app

  // Detect shake gesture to trigger panic button
  ShakeDetector.autoStart(
    onPhoneShake: (_) {
      PanicButtonController().triggerPanicButton();
    },
  );

  runApp(SecureNoteApp());
}
