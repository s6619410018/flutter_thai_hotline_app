import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:thai_hotline_app/views/splash_screen_ui.dart';
import 'package:thai_hotline_app/views/introduction_call_ui.dart';
import 'package:thai_hotline_app/views/home_ui.dart';
import 'package:thai_hotline_app/views/about_ui.dart';

import 'package:thai_hotline_app/views/sub_a_home_ui.dart';
import 'package:thai_hotline_app/views/sub_b_home_ui.dart';
import 'package:thai_hotline_app/views/sub_c_home_ui.dart';
import 'package:thai_hotline_app/views/sub_d_home_ui.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ThaiHotlineApp());
}

class ThaiHotlineApp extends StatelessWidget {
  const ThaiHotlineApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Thai Hotline App',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF619E39)),
        textTheme: GoogleFonts.kanitTextTheme(),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreenUI(),
        '/intro': (context) => const IntroductionCallUI(),
        '/home': (context) => const HomeUI(),
        '/about': (context) => const AboutUI(),
        '/sub_a': (context) => const SubAHomeUI(),
        '/sub_b': (context) => const SubBHomeUI(),
        '/sub_c': (context) => const SubCHomeUI(),
        '/sub_d': (context) => const SubDHomeUI(),
      },
    );
  }
}
