import 'package:flutter/material.dart';
import 'package:ibls/components/register_new_vehicle_card.dart';
import 'package:ibls/Screens/new_vehicle_screen.dart';
import 'package:ibls/Screens/request_vehicle_screen.dart';
import 'package:ibls/variables.dart';
import '../components/fonts.dart';

class ExistingOrNewScreen extends StatelessWidget {
  const ExistingOrNewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
                children: [
              
              const SizedBox(
                height: 25,
              ),

              //searchbar
               GestureDetector(
                onTap: (() {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const RequestExistingVehicleScreen()));
                }),
                 child:  Container(
                  height: 60,
                  width: double.maxFinite,
                  padding:const  EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(15),
                  ),
                    child: Row(
                      children:  [
                        Icon(
                          Icons.search,
                          size: 30,
                          color: Theme.of(context).colorScheme.tertiary,
                        ),
                        const SizedBox(width: 10,),
                        Text("Search for Existing vehicles",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.tertiary,
                          fontSize: 20,
                        ),)
                      ],
                    ),
                 )
               ),

              largeGap(),
              largeGap(),
              largeGap(),
              largeGap(),
              largeGap(),
              smallGap(),
              largeGap(),
              Align(
                alignment: Alignment.center,
                child: GestureDetector(
                    onTap: (() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterNewVehicleScreen()));
                    }),
                    child: const RegisterNewVehicleCard()),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
