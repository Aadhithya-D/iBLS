import "package:flutter/material.dart";
import 'package:ibls/components/fonts.dart';
import '../variables.dart';

//(only if needed) it is found in existng vehicle screen
class RequestVehicleCard extends StatelessWidget {
  final vehicleNumber;
  final ownerName;

  const RequestVehicleCard(
      {super.key, required this.vehicleNumber, required this.ownerName});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      decoration:  BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.all(Radius.circular(15))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Text(vehicleNumber, style: cardFont2(context)),
                const Spacer(),
                Text(
                  ownerName,
                  style: cardFont2(context),
                ),
              ],
            ),
            button1(context),
          ],
        ),
      ),
    );
  }

  Widget button1(BuildContext context) {
    return GestureDetector(
      onTap: () {
          //code to request vehicle
        },
      child: Container(
        width: double.maxFinite,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: green,
        ),
        child: const Center(
            child: Text(
          'Request',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        )),
      ),
    );
  }
}
