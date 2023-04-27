import "package:flutter/material.dart";
import 'fonts.dart';

class RegisterNewVehicleCard extends StatelessWidget {
  const RegisterNewVehicleCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(0,10,0,10),
        height: 170,
        width: double.maxFinite,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20,))
        ),
        child:  Card(
          color:  Theme.of(context).colorScheme.primary,
          elevation: 5,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Stack(
                    children:  [
                      Padding(
                        padding: EdgeInsets.only(left: 10,top: 10),
                        child: Column(
                          children: [

                             Icon(
                              Icons.add,
                              size: 75,
                              color: Theme.of(context).colorScheme.tertiary,
                            ),

                            Text("Register New Vehicle",style: cardFont2(context),)
                           
                      
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ),
      );
  }
}