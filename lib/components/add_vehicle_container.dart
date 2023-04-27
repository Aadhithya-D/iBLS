import "package:flutter/material.dart";
import 'fonts.dart';

class AddVehicleCard extends StatelessWidget {
  const AddVehicleCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 130,
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(20,)),
        color:  Theme.of(context).colorScheme.primary,
      ),
      child:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.add, size: 50, color: Theme.of(context).colorScheme.tertiary,),
          Text("Register/Request Vehicle",style: cardFont2(context),)
        ],
      )
    );
  }
}
