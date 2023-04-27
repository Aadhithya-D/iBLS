import 'package:flutter/material.dart';
import 'package:ibls/components/fonts.dart';
import 'package:ibls/variables.dart';


class RegisterNewVehicleScreen extends StatelessWidget {
  const RegisterNewVehicleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),

      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                smallGap(),
                 Text("Register New Vehicle",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.tertiary,
                    fontWeight: FontWeight.w400,
                    fontSize: 30,
                  ),
                  textAlign: TextAlign.center,
                ),


                largeGap(),
                largeGap(),

                Image.asset("lib/Images/resume.png", height: 140,),

                largeGap(),
                largeGap(),

                 TextField(
textCapitalization: TextCapitalization.characters,
                  style: const TextStyle(
                    color: white,
                    fontSize: 20,
                  ),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
                      borderRadius: const BorderRadius.all(Radius.circular(15))
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
                      borderRadius: const BorderRadius.all(Radius.circular(15))
                    ),
                    filled: true,
                    fillColor: Theme.of(context).colorScheme.primary,
                    hintText: "TN XX 11 1234",
                    hintStyle: TextStyle(
                      color: Colors.white30,
                      fontSize: 20,
                    ),
                    labelText: "Vehicle Number",
                    labelStyle: TextStyle(
                      color: white,

                    )
                  ),
                ),

                

                largeGap(),
                largeGap(),

                GestureDetector(
                onTap: (() {
                  //code to register new vehicle
                }),
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  child: Center(
                    child: Text(
                      "Register Vehicle",
                      style: cardFontWhite(),
                    ),
                  ),
                ),
              ),

              ],
            ),
          )
        )
      ),
    );
  }
}