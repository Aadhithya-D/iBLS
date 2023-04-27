import 'package:flutter/material.dart';
import 'package:ibls/components/fonts.dart';
import 'package:ibls/variables.dart';

//it is found in vehicle details screen it shows the username and velidity
class UserContainerVehicleDetails extends StatelessWidget {

  final userName;
  final userDuration;

  String real_duration(String temp){
    String new_string;
    if(temp=="Permanent"){
      return "Valid permanently";
    } else{
      return "Valid upto ${temp}";
    }
  }

  Widget icon_dynamic(String temp,BuildContext context){
    if(temp=="Permanent"){
      return Padding(
              padding: const EdgeInsets.only(right: 13),
              child: Image.asset("lib/Images/stopwatch.png", height: 50,)
              // Icon(
              //   Icons.more_time,
              //   size: 40,
              //   color: Theme.of(context).colorScheme.tertiary,
              // ),
            );
    } else{
      return Padding(
              padding: const EdgeInsets.only(right: 13),
              child:  Image.asset("lib/Images/time-limit.png", height: 50,)
            );
    }
  }


  const UserContainerVehicleDetails({
    super.key,
    required this.userName,
    required this.userDuration
    });

  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.all(Radius.circular(15))
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        child: Row(
          children: [

            icon_dynamic(userDuration,context),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(userName,style: cardFont1(context)),
                SizedBox(height: 5,),
                Text("${real_duration(userDuration)}",style: cardFont1(context),),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

