import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ibls/components/add_vehicle_container.dart';
import 'package:ibls/components/vehicle_card.dart';
import 'package:ibls/Screens/existing_or_new_vehicle.dart';
import 'package:ibls/Screens/profile_screen.dart';
import '../controllers/ibls_controller.dart';
import 'owner_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final iBLSController iblsController = Get.put(iBLSController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "iBLS",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.account_circle,
              color: Colors.white,
              size: 30,
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProfileScreen()));
              // do something
            },
          ),
          SizedBox(width: 2,)
        ],
      ),
      backgroundColor: Theme
          .of(context)
          .colorScheme
          .background,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Obx(() {
              return ListView(
                children: <Widget>[
                  ListView.builder(
                    physics: const ScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: iblsController.userVehicleList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          var vehicleNumber = iblsController.userVehicleList[index].vehicleNumber;
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => OwnerScreen(vehicleNumber: vehicleNumber,)));
                        },
                        child: Column(
                          children: [
                            VehicleCard(
                                vehicleNum: iblsController.userVehicleList[index].vehicleNumber,
                                noOfUsers: iblsController.vehicleUserList[iblsController.userVehicleList[index].vehicleNumber]?.length,
                                requests: false,
                                requestNum: 2),
                            const SizedBox(height: 15,)
                          ],
                        ),
                      );
                    },
                  ),
                  GestureDetector(
                      onTap: (() {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => ExistingOrNewScreen()));
                      }),
                      child: Column(
                        children: const [
                          AddVehicleCard(),
                          SizedBox(height: 15,)
                        ],
                      )
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
