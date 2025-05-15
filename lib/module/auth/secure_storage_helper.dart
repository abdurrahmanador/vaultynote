
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageHelper{
  static final _storage=FlutterSecureStorage();

  static Future<void> savePassword(String password)async{
    await _storage.write(key: 'user_password', value:password);
  }
  static Future<String?> getPassword()async{
    return await _storage.read(key: 'user_password');
  }
  static Future<void> updatePassword(String newPassword) async {
    await _storage.write(key: 'user_password', value: newPassword);
  }

}