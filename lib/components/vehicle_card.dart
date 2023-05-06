import "package:flutter/material.dart";
import 'badge_in_container.dart';
import 'fonts.dart';

//it is found in home screen it shows the vehicle numeber,# users
class VehicleCard extends StatelessWidget {
  final vehicleNum;
  final noOfUsers;
  final requests;
  final requestNum;

  const VehicleCard({super.key, 
    required this.vehicleNum,  
    required this.noOfUsers, 
    required this.requests,
    required this.requestNum});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.maxFinite,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(20,)),
            color:  Theme.of(context).colorScheme.primary,
        ),// padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child:  Row(
          children: [
            Padding(padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),child: Image.asset("lib/Images/motorcycle.png", height: 60,)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(vehicleNum,style: cardFont2(context)),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text("Number of users: $noOfUsers",style: cardFont2(context)),
                    const SizedBox(width: 30,),
                    badge(requests,requestNum,context),
                  ],
                ),
              ],
            ),
          ],
        ),
      );
  }
 
}
