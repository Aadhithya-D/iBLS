import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:ibls/components/user_card_vehicle_details.dart';
import 'package:ibls/components/vehicle_details_card.dart';
import 'package:ibls/variables.dart';

import '../components/fonts.dart';
import '../controllers/ibls_controller.dart';

class VehicleDetailsScreen extends StatelessWidget {
  final iBLSController iblsController = Get.put(iBLSController());
  final vehicleNumber;

  VehicleDetailsScreen({super.key, required this.vehicleNumber});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Vehicle Details", style: headingTextStyle()),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Theme
          .of(context)
          .colorScheme
          .background,
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(() {
                    return VehicleDetailsCard(
                        ownerName: iblsController
                            .vehicleUserList[vehicleNumber]?[0].ownerName,
                        vehicleNumber: vehicleNumber);
                  }),

                  largeGap(),

                  Text("Users", style: TextStyle(
                      fontSize: 30,
                      color: Theme
                          .of(context)
                          .colorScheme
                          .tertiary,
                      fontWeight: FontWeight.bold
                  ),
                  ),

                  largeGap(),
                  Obx(() {
                    return ListView.builder(physics: const ScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: iblsController.vehicleUserList[vehicleNumber]
                            ?.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [
                              UserContainerVehicleDetails(
                                  userName: iblsController.vehicleUserList[vehicleNumber]?[index].userName, userDuration: iblsController.vehicleUserList[vehicleNumber]?[index].validity??"Permanent"),
                              smallGap(),
                            ],
                          );
                        });
                  })


                  // UserContainerVehicleDetails(
                  //     userName: "User-2", userDuration: "Permanent"),
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
