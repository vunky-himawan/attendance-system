import 'package:eventpass_app/presentation/misc/colors.dart';
import 'package:eventpass_app/presentation/pages/auth/auth_guard/auth_guard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_fonts/google_fonts.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
const FlutterSecureStorage secureStorage = FlutterSecureStorage();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // await secureStorage.deleteAll();

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(
          seedColor: darkBlue,
          surface: backgroundColor,
          primary: ghostBlack,
          secondary: darkBlue,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
        textTheme: TextTheme(
          bodyMedium: GoogleFonts.poppins(
            color: ghostBlack,
          ),
          bodyLarge: GoogleFonts.poppins(
            color: ghostBlack,
            fontWeight: FontWeight.w500,
          ),
          labelLarge: GoogleFonts.poppins(
            color: ghostBlack,
          ),
          bodySmall: GoogleFonts.poppins(
            color: ghost,
          ),
        ),
      ),
      navigatorKey: navigatorKey,
      home: const AuthGuard(),
    );
  }
}

// class MyApp extends ConsumerStatefulWidget {
//   const MyApp({super.key});

//   @override
//   ConsumerState<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends ConsumerState<MyApp> {
//   @override
//   void initState() {
//     super.initState();
//     checkLoginStatus(); // Periksa status login dan mengarahkan pengguna
//   }

//   Future<void> checkLoginStatus() async {
//     final token = await AuthGuard.getToken(); // Ambil token yang disimpan

//     if (token != null) {
//       final role =
//           await AuthGuard.getRoleFromToken(); // Dapatkan role dari token

//       if (role != null) {
//         // Jika token ada dan role terdeteksi, arahkan pengguna ke halaman berdasarkan role
//         switch (role) {
//           case 'RECEPTIONIST':
//             ref.read(routerProvider).go('/receptionist');
//             break;
//           case 'EVENT_ORGANIZER':
//             ref.read(routerProvider).go('/event-organizer');
//             break;
//           case 'SUPERADMIN':
//             ref.read(routerProvider).go('/superadmin');
//             break;
//           case 'PARTICIPANT':
//             ref.read(routerProvider).go('/participant');
//             break;
//           default:
//             ref
//                 .read(routerProvider)
//                 .go('/'); // Arahkan ke halaman utama jika role tidak ditemukan
//             break;
//         }
//       }
//     } else {
//       ref.read(routerProvider).go('/'); // Arahkan ke login jika token tidak ada
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp.router(
//       theme: ThemeData.from(
//         colorScheme: ColorScheme.fromSeed(
//           seedColor: darkBlue,
//           surface: backgroundColor,
//           primary: ghostBlack,
//           secondary: darkBlue,
//           brightness: Brightness.dark,
//         ),
//         useMaterial3: true,
//         textTheme: TextTheme(
//           bodyMedium: GoogleFonts.poppins(
//             color: ghostBlack,
//           ),
//           bodyLarge: GoogleFonts.poppins(
//             color: ghostBlack,
//             fontWeight: FontWeight.w500,
//           ),
//           labelLarge: GoogleFonts.poppins(
//             color: ghostBlack,
//           ),
//           bodySmall: GoogleFonts.poppins(
//             color: ghost,
//           ),
//         ),
//       ),
//       debugShowCheckedModeBanner: false,
//       routeInformationParser: ref.watch(routerProvider).routeInformationParser,
//       routeInformationProvider:
//           ref.watch(routerProvider).routeInformationProvider,
//       routerDelegate: ref.watch(routerProvider).routerDelegate,
//     );
//   }
// }
