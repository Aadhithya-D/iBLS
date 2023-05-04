// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ibls/variables.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileScreen extends StatelessWidget {
   ProfileScreen({super.key});

  final double coverHeight = 200;
  final double photoHeight = 150;
   final supabase = Supabase.instance.client;
  

  TextStyle profileFont(BuildContext context){
  return  TextStyle(
    fontWeight: FontWeight.bold,
    color: Theme.of(context).colorScheme.tertiary,
    fontSize: 35,
  );
}



Widget coverBackground(BuildContext context){
  return Container(
    height: coverHeight,
    width: double.infinity,
    color: Theme.of(context).colorScheme.primary,
  );
}

Widget profilePhoto(BuildContext context) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(100),
      color: Theme.of(context).colorScheme.background
    ),
    child: Icon(
      Icons.account_circle,
      size: photoHeight,
      color: white,
    ),
  );
}

Widget top_part(BuildContext context)
 {
  final double top = coverHeight - photoHeight/2;
  final double bottom = photoHeight/2;
  return Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          Container(
            child: coverBackground(context),
            padding: EdgeInsets.only(bottom: bottom),
          ),
          Positioned(
            top: top,
            child: profilePhoto(context),
          )
        ],
      );
 }

  @override
  Widget build(BuildContext context) {

    Future<void> signUserOut() async {

      await supabase.auth.signOut();

      Navigator.pop(context);
    }

    return Scaffold(

      backgroundColor: Theme.of(context).colorScheme.background,

      appBar: AppBar(
        title: const Text("Profile",style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w500
        )),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,

        actions: [
          IconButton(
            onPressed: signUserOut, icon: Icon(
              Icons.logout,
              color: Colors.white,
            )
          )
        ],
      ),


      body: ListView(
        children: [
          top_part(context),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Adithya",style: profileFont(context),),

              largeGap(),

              Text("19 years",style: profileFont(context),)
            ],  
          )
        ],
        )
      


    );
  }
}

