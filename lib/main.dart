import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

import 'features/views/home/home_tabs/views/home_tabs_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EKABAV - INSTAGRAM',
      theme: ThemeData(
        // textTheme: GoogleFonts.allerta(Theme.of(context).textTheme),
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const SafeArea(child: HomeTabsView()),
    );
  }
}
