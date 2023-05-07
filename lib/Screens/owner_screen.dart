import 'package:flutter/material.dart';
import 'package:ibls/Screens/requests._screen.dart';
import 'package:ibls/Screens/vehicle_details.dart';

class OwnerScreen extends StatefulWidget {
  final vehicleNumber;
  const OwnerScreen({super.key, required this.vehicleNumber});

  @override
  State<OwnerScreen> createState() => _OwnerScreenState();
}

class _OwnerScreenState extends State<OwnerScreen> {

  int _currentIndex = 0;
   void _onItemTapped(int index) {  
    setState(() {  
      _currentIndex = index;  
    });  
  }

  @override
  Widget build(BuildContext context) {
    final List <Widget>_pages=[
      VehicleDetailsScreen(vehicleNumber: widget.vehicleNumber,),
      const RequestsScreen()
    ];
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      bottomNavigationBar: BottomNavigationBar(
        items:  <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.emoji_transportation,color: Theme.of(context).colorScheme.tertiary,),
            label: "Vehicle Details",
            backgroundColor: Theme.of(context).colorScheme.primary
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_add,color: Theme.of(context).colorScheme.tertiary,),
            label: "Requests",
            backgroundColor: Theme.of(context).colorScheme.primary
          ),

        ],
        type: BottomNavigationBarType.shifting,  
        currentIndex: _currentIndex,  
        selectedItemColor: Theme.of(context).colorScheme.tertiary,  
        iconSize: 40,  
        onTap: _onItemTapped,  
        elevation: 5 
      ),
      body: _pages[_currentIndex],
    );
  }
}