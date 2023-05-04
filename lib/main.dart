// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ibls/Screens/auth_page.dart';
import 'package:ibls/theme/theme_data.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  await Supabase.initialize(
    url: 'https://wmuhlupfdfwlmdkcrqnd.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6IndtdWhsdXBmZGZ3bG1ka2NycW5kIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzkzNzE1NzEsImV4cCI6MTk5NDk0NzU3MX0.IjOnyBpVKWG_EPLrzLWakbcF3nNwsm3lrCI_RGtcJdc',
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final supabase = Supabase.instance.client;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthPage(),
      theme: AppTheme.darkThemeData,);
  }
}
