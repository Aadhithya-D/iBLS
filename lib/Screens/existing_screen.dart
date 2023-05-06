import "package:flutter/material.dart";

import '../variables.dart';
import 'home_screen.dart';

class ExistingScreen extends StatelessWidget {
  const ExistingScreen({super.key});

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
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                largeGap(),
                 Text("Request for existing vehicle",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                  textAlign: TextAlign.center,
                ),

                largeGap(),
                largeGap(),
                largeGap(),

                 TextField(
                  style: const TextStyle(
                    color: white,
                    fontSize: 20,
                  ),
                  
                  
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Theme.of(context).colorScheme.secondary),
                      borderRadius:const  BorderRadius.all(Radius.circular(15))
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Theme.of(context).colorScheme.secondary),
                      borderRadius:const BorderRadius.all(Radius.circular(15))
                    ),
                    filled: true,
                    fillColor: Theme.of(context).colorScheme.primary,
                    hintText: "TN XX 11 1234",
                    hintStyle: const TextStyle(
                      color: Colors.white30,
                      fontSize: 20,
                    ),
                    
                    // errorBorder: OutlineInputBorder(
                    //   borderSide: BorderSide(color: Colors.red),
                    //   borderRadius: BorderRadius.all(Radius.circular(15))
                    // ),

                    
                    //errorText: "Enter vehicle number",
                    
                    labelText: "Vehicle Number",
                    labelStyle: const TextStyle(
                      color: white,

                    )
                  ),
                ),

                largeGap(),

                 TextField(
                  style: const TextStyle(
                    color: white,
                    fontSize: 20,
                  ),
                  
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Theme.of(context).colorScheme.secondary),
                      borderRadius: const BorderRadius.all(Radius.circular(15))
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Theme.of(context).colorScheme.secondary),
                      borderRadius: const BorderRadius.all(Radius.circular(15))
                    ),
                    filled: true,
                    fillColor: Theme.of(context).colorScheme.primary,
                    hintText: "Activa",
                    hintStyle: const TextStyle(
                      color: Colors.white30,
                      fontSize: 20,
                    ),

                    labelText: "Vehicle Name",
                    labelStyle: const TextStyle(
                      color: white,

                    )
                  ),
                ),

                largeGap(),
                largeGap(),

                GestureDetector(
                onTap: (() {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
                }),
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                  child: const Center(
                    child: Text(
                      "Request Vehicle",
                      style: TextStyle(
                        color: white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
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