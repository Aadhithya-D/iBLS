import 'package:flutter/material.dart';
import '../variables.dart';


TextStyle cardFont1(BuildContext context){
  return   TextStyle(
    color: Theme.of(context).colorScheme.tertiary,
    fontSize: 17,
  );
}

TextStyle cardFont2(BuildContext context){
  return  TextStyle(
    color: Theme.of(context).colorScheme.tertiary,
    fontSize: 20,
  );
}
TextStyle cardFontBig(BuildContext context){
  return  TextStyle(
    color: Theme.of(context).colorScheme.tertiary,
    fontSize: 27,
  );
}
TextStyle cardFontWhite(){
  return const TextStyle(
    color: white,
    fontSize: 15,
  );
}


TextStyle headingTextStyle(){
  return  TextStyle(fontWeight: FontWeight.bold, fontSize: 30);
}
