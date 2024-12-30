import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthGuard {
  static const _storage = FlutterSecureStorage();

  // Fungsi untuk memeriksa apakah token ada
  static Future<bool> isAuthenticated() async {
    final token = await _storage.read(key: 'token');
    return token != null;
  }

  static Future<String?> getRoleFromToken() async {
    final token = await getToken();
    if (token != null) {
      try {
        final decodedToken = JWT.decode(token);
        final role =
            decodedToken.payload['sub']['role']; // Ambil 'role' dari payload
        return role;
      } catch (e) {
        print('Error decoding token: $e');
      }
    }
    return null;
  }

  // Fungsi untuk mendapatkan token
  static Future<String?> getToken() async {
    return await _storage.read(key: 'token');
  }
}
