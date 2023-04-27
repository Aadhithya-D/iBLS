import "package:flutter/material.dart";
import 'package:ibls/components/user_card_request.dart';

import '../components/fonts.dart';


class RequestsScreen extends StatelessWidget {
  const RequestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Requests",style:headingTextStyle()),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),


      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: ListView.builder(
              itemCount: 2,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                  child: UserCardRequest(userName: "User-1", userDuration: "Permanent"),
                );
              },

            ),
          ),
        ),
      ),
    );
  }
}