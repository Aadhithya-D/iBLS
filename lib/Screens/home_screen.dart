import "package:flutter/material.dart";
import 'package:ibls/components/add_vehicle_container.dart';
import 'package:ibls/components/vehicle_card.dart';
import 'package:ibls/Screens/existing_or_new_vehicle.dart';
import 'package:ibls/Screens/profile_screen.dart';
import 'owner_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
                      builder: (context) =>  ProfileScreen()));
              // do something
            },
          ),
          SizedBox(width: 2,)
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: ListView(
              children: <Widget>[
                ListView.builder(
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 15,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OwnerScreen()));
                      },
                      child: Column(
                        children: [
                          VehicleCard(
                              vehicleNum: "TN 11 AX 1234",
                              noOfUsers: "5",
                              requests: true,
                              requestNum: 2),
                          SizedBox(height: 15,)
                        ],
                      ),
                    );
                  },
                ),
                GestureDetector(
                  onTap: (() {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> ExistingOrNewScreen()));
                  }),
                  child: Column(
                    children: [
                      AddVehicleCard(),
                      SizedBox(height: 15,)
                    ],
                  )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
