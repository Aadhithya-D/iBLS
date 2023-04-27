import "package:flutter/material.dart";
Widget badge(bool x,int reqNum,BuildContext context){

      if(x){
        return Container(
       height: 23,
       width: 23,
       decoration: BoxDecoration(
         color: Theme.of(context).colorScheme.background,
         borderRadius: BorderRadius.circular(100)
       ),
        child: Center(
          child: Text(reqNum.toString(),
       style: TextStyle(
          color: Theme.of(context).colorScheme.tertiary,
          fontSize: 16,
          fontWeight: FontWeight.bold,
       )),
        ),
     );
      }
      else{
        return Container(
       height: 17,
       width: 17,
       decoration: BoxDecoration(
         color: Colors.transparent,
         borderRadius: BorderRadius.circular(100)
       ),
     );
    }
      
 }
