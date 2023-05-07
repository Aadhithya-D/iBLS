import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
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
  final iBLSController iblsController = Get.put(iBLSController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<AuthState>(
        stream: supabase.auth.onAuthStateChange,
        builder: (context, snapshot) {
          // user is logged in
          if (snapshot.data?.event == AuthChangeEvent.signedIn) {
            return Obx(() {
              final currentUser = supabase.auth.currentUser;
              if(iblsController.justSignedOut.value) {
                if (currentUser != null) {
                  if (kDebugMode) {
                    print(currentUser.id);
                  }
                  iblsController.getUserData(currentUser.id);
                  iblsController.getUserVehicleData(currentUser.id);
                }
              }
              return HomeScreen();
            });
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
