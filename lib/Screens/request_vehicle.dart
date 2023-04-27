import "package:flutter/material.dart";
import '../components/fonts.dart';
import '../variables.dart';

class RequestExistingVehicleScreen extends StatelessWidget {
  const RequestExistingVehicleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Request Vehicle", style: headingTextStyle()),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),

      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: ListView(
            children: [

              largeGap(),
               TextField(

                    autofocus: true,
                    style: const TextStyle(
                      color: white,
                      fontSize: 20,
                    ),
                    
                    
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Theme.of(context).colorScheme.tertiary),
                        borderRadius: const BorderRadius.all(Radius.circular(15))
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Theme.of(context).colorScheme.tertiary),
                        borderRadius: const BorderRadius.all(Radius.circular(15))
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
            ],
          ),
        )
      ),
    );
  }
}