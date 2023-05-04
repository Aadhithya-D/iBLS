import 'dart:async';

import 'package:ibls/Screens/home_page.dart';
import 'package:ibls/Screens/home_screen.dart';
import 'package:ibls/Screens/login_or_register.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ibls/controllers/ibls_controller.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthPage extends StatelessWidget {
  AuthPage({super.key});
  final supabase = Supabase.instance.client;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<AuthState>(
        stream: supabase.auth.onAuthStateChange,
        builder: (context, snapshot) {
          // user is logged in
          if (snapshot.data?.event == AuthChangeEvent.signedIn) {
            final currentUser = supabase.auth.currentUser;
            if (currentUser != null) {
              print(currentUser.id);
              iBLSController().getUserData(currentUser.id);
            }
            return const HomeScreen();
          }
          // user is NOT logged in
          else {
            return const LoginOrRegister();
          }
        },
      ),
    );
  }
}
