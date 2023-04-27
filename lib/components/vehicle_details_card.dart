import "package:flutter/material.dart";
import 'fonts.dart';


//it is found in vehicle details screen and it shows the profile photo,owner name,vehicle number
class VehicleDetailsCard extends StatelessWidget {

  final ownerName;
  final vehicleNumber;

  const VehicleDetailsCard({
    super.key,
    required this.ownerName,
    required this.vehicleNumber
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.all(Radius.circular(15))
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Owner: $ownerName",style: cardFontBig(context),),
          SizedBox(height: 15,),
          Text(vehicleNumber,style: cardFontBig(context),)
        ],
      ),
    );
  }
}

