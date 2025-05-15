import 'package:encrypt/encrypt.dart' as encrypt;

class EncryptionHelper {
  // You can change this key to any secure string, but make sure it's 16, 24, or 32 bytes long
  static final String _keyString = '0123456789abcdef'; // 16-byte key for AES-128
  static final String _ivString = '1234567890abcdef'; // 16-byte IV for AES

  static final key = encrypt.Key.fromUtf8(_keyString);
  static final iv = encrypt.IV.fromUtf8(_ivString);
  static final encrypter = encrypt.Encrypter(encrypt.AES(key));

  // Encrypt text
  static String encryptText(String text) {
    final encrypted = encrypter.encrypt(text, iv: iv);
    return encrypted.base64;
  }

  // Decrypt text
  static String decryptText(String encryptedText) {
    final decrypted = encrypter.decrypt64(encryptedText, iv: iv);
    return decrypted;
  }
}
