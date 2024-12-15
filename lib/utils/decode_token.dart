import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:flutter/material.dart';

Future<Map<String, dynamic>> decodeToken(String token) async {
  if (token.isEmpty) {
    throw FlutterError('Token not found or is empty.');
  }

  try {
    final jwtData = JWT.decode(token);
    final payload = jwtData.payload;

    return payload;
  } catch (e) {
    throw FlutterError('Failed to decode token: $e');
  }
}
