import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:eventpass_app/presentation/misc/colors.dart';
import 'package:eventpass_app/presentation/providers/router/router_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
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
      debugShowCheckedModeBanner: false,
      routeInformationParser: ref.watch(routerProvider).routeInformationParser,
      routeInformationProvider:
          ref.watch(routerProvider).routeInformationProvider,
      routerDelegate: ref.watch(routerProvider).routerDelegate,
    );
  }
}
