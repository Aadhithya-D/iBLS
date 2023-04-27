import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void signUserOut(){
      FirebaseAuth.instance.signOut();
    }
    return Scaffold(
      backgroundColor: const Color(0xFF393E46),
      appBar: AppBar(
        centerTitle: true,
        title: const Text("iBLS", style: TextStyle(color: Color(0xFFEEEEEE), fontWeight: FontWeight.bold),),
        actions: [
          IconButton(onPressed: signUserOut, icon: const Icon(Icons.logout))
        ],
      ),
    );
  }
}
