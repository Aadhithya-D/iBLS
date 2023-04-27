import "package:flutter/material.dart";
import 'package:ibls/components/user_card_vehicle_details.dart';
import 'package:ibls/components/vehicle_details_card.dart';
import 'package:ibls/variables.dart';

import '../components/fonts.dart';

class VehicleDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Vehicle Details", style: headingTextStyle()),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: SingleChildScrollView(
                  child:Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      VehicleDetailsCard(
                          ownerName: "Adithya",
                          vehicleNumber: "TN 10 AX 1234"),

                      largeGap(),

                      Text("Users",style: TextStyle(
                        fontSize: 30,
                        color: Theme.of(context).colorScheme.tertiary,
                        fontWeight: FontWeight.bold
                      ),
                      ),

                      largeGap(),

                      UserContainerVehicleDetails(
                          userName: "User-1", userDuration: "24 hrs"),
                      smallGap(),
                      UserContainerVehicleDetails(
                          userName: "User-2", userDuration: "Permanent"),
                    ],
                  ),
              ),
            )),
    );
  }
}

TextStyle userFont() {
  return TextStyle(
    color: white,
    fontWeight: FontWeight.bold,
    fontSize: 20,
  );
}
