import 'package:eventpass_app/presentation/providers/router/guard/auth_guard.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authTokenProvider = FutureProvider<String?>((ref) async {
  return await AuthGuard.getToken();
});
