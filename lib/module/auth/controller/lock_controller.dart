import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';

import '../../home/view/home_view.dart';
import '../secure_storage_helper.dart';

class LockController extends GetxController {
  final passwordController = TextEditingController();
  final LocalAuthentication auth = LocalAuthentication();
  var isLoading = true.obs;
  var hasPassword = false.obs;

  @override
  void onInit() {
    super.onInit();
    _checkPassword();
  }
  Future<void> changePassword(String currentPassword, String newPassword) async {
    String? savedPassword = await SecureStorageHelper.getPassword();
    if (currentPassword == savedPassword) {
      await SecureStorageHelper.updatePassword(newPassword);
      Get.snackbar('Success', 'Password updated successfully');
    } else {
      Get.snackbar('Error', 'Current password is incorrect');
    }
  }
  Future<void> _checkPassword() async {
    String? password = await SecureStorageHelper.getPassword();
    hasPassword.value = password != null;
    isLoading.value = false;
  }

  Future<void> createPassword() async {
    if (passwordController.text.isNotEmpty) {
      await SecureStorageHelper.savePassword(passwordController.text);
      Get.offAll(() => HomeView());
    } else {
      Get.snackbar('Error', 'Password cannot be empty');
    }
  }

  Future<void> unlock() async {
    String? savedPassword = await SecureStorageHelper.getPassword();
    if (passwordController.text == savedPassword) {
      Get.offAll(() => HomeView());
    } else {
      Get.snackbar('Error', 'Wrong Password');
    }
  }

  Future<void> unlockWithBiometric() async {
    bool authenticated = await auth.authenticate(
      localizedReason: 'Scan your fingerprint to unlock',
      options: AuthenticationOptions(biometricOnly: true),
    );
    if (authenticated) {
      Get.offAll(() => HomeView());
    }
  }
}
