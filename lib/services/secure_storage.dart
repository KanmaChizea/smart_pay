import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageHelper {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  // Method to get a value from secure storage
  Future<String?> read(String key) async {
    return await _storage.read(key: key);
  }

  // Method to write a value to secure storage
  Future<void> write(String key, String value) async {
    await _storage.write(key: key, value: value);
  }

  // Method to delete a value from secure storage
  Future<void> delete(String key) async {
    await _storage.delete(key: key);
  }

  // Method to delete all values from secure storage
  Future<void> deleteAll() async {
    await _storage.deleteAll();
  }
}
