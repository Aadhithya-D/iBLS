import 'package:flutter/material.dart';
import 'package:ibls/components/fonts.dart';
import 'package:ibls/variables.dart';

//it is found in request screen which is used to accept and decline the requests
class UserCardRequest extends StatelessWidget {

  final userName;
  final userDuration;

  const UserCardRequest({
    super.key,
    required this.userName,
    required this.userDuration
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      
      decoration:  BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: const BorderRadius.all(Radius.circular(15))
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            Row(
              children: [
                SizedBox(width: 10,),
                Text(userName,style: cardFont2(context)),
                const Spacer(),
                Text(userDuration,style: cardFont2(context),),
                SizedBox(width: 10,),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                button1(),
                button2(),
              ],
            )
          ],
        ),
      ),
    );
  }
}



Widget button1(){
  return GestureDetector(
  onTap: () {},
  child: Container(
    width: 150,
    height: 50,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Colors.green
    ),
    child:  Center(child: Text('Accept',style: cardFontWhite(),)),
  ),
);
}

Widget button2(){
  return GestureDetector(
  onTap: () {},
  child: Container(
    width: 150,
    height: 50,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: red,
    ),
    child:  Center(child: Text('Decline',style: cardFontWhite(),)),
  ),
);
}