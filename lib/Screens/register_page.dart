import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ibls/components/my_button.dart';
import 'package:ibls/components/my_textfield.dart';
import 'package:flutter/material.dart';


class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // text editing controllers
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final aadharController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final db = FirebaseFirestore.instance;

  void wrongInfo(String error){
    showDialog(context: context, builder: (context){
      return AlertDialog(
        title: const Text("iBLS", style: TextStyle(color: Color(0xFFEEEEEE)),),
        content: Text(error, style: const TextStyle(color: Color(0xFFEEEEEE)),),
        backgroundColor: const Color(0xFF393E46),
        titlePadding: const EdgeInsets.all(20),
        actions: [
          TextButton(onPressed: (){
            Navigator.of(context).pop();
          }, child: const Text("Ok", style: TextStyle(color: Color(0xFFEEEEEE))))
        ],
      );
    });
  }

  void signUserUp() async {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );


      if (passwordController.text == confirmPasswordController.text) {
        if (aadharController.text[0] != "0" && aadharController.text[0] != "1" && aadharController.text.length == 12) {
          var diff = 0;
          final docRef = db.collection("AadharData").doc(aadharController.text);
          docRef.get().then((DocumentSnapshot doc) async {
            final data = doc.data() as Map<String, dynamic>;
            print(data["DOB"].runtimeType.toString());
            DateTime dob = (data["DOB"] as Timestamp).toDate();
            DateTime now = DateTime.now();
            diff = (now
                .difference(dob)
                .inDays/ 365).round();
            print(diff);
            if (diff >= 18) {
              try {
                await FirebaseAuth.instance
                    .createUserWithEmailAndPassword(
                  email: emailController.text,
                  password: passwordController.text,
                )
                    .then((value) =>
                {
                  FirebaseFirestore.instance
                      .collection("UserData")
                      .doc(value.user?.uid)
                      .set({
                    "name": nameController.text,
                    "email": value.user?.email,
                    "aadhar_number": aadharController.text
                  })
                });
                Navigator.pop(context);
              }
              on FirebaseAuthException catch (e) {
                Navigator.pop(context);
                wrongInfo(e.message.toString());
              }
            }
            else{
              Navigator.pop(context);
              wrongInfo("You are not eligible to drive");
            }
          },
              onError: (e) {
                Navigator.pop(context);
                wrongInfo("User aadhar details not available");
              });
        }
        else{
          Navigator.pop(context);
          wrongInfo("Invalid Aadhar Number");
        }
      } else {
        Navigator.pop(context);
        wrongInfo("Passwords don't match!");
      }

  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   Icon(
                    Icons.lock,
                    color: Theme.of(context).colorScheme.tertiary,
                    size: 70,
                  ),

                  const SizedBox(height: 25),

                   Text(
                    'Let\'s create an account for you!',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.tertiary,
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 25),
                  MyTextField(
                    controller: nameController,
                    hintText: 'Name',
                    obscureText: false,
                    type: TextInputType.name,
                    icon: Icons.person,
                  ),
                  const SizedBox(height: 10),
                  MyTextField(
                    controller: emailController,
                    hintText: 'Email',
                    obscureText: false,
                    type: TextInputType.emailAddress,
                    icon: Icons.email,
                  ),

                  const SizedBox(height: 10),

                  // password textfield
                  MyTextField(
                    controller: aadharController,
                    hintText: 'Aadhar Number',
                    obscureText: false,
                    type: TextInputType.phone,
                    icon: Icons.credit_card,
                  ),

                  const SizedBox(height: 10),

                  // password textfield
                  MyTextField(
                    controller: passwordController,
                    hintText: 'Password',
                    obscureText: true,
                    type: TextInputType.visiblePassword,
                    icon: Icons.key,
                  ),

                  const SizedBox(height: 10),

                  // confirm password textfield
                  MyTextField(
                    controller: confirmPasswordController,
                    hintText: 'Confirm Password',
                    obscureText: true,
                    type: TextInputType.visiblePassword,
                    icon: Icons.key,
                  ),

                  const SizedBox(height: 25),

                  // sign in button
                  MyButton(
                    text: "Sign Up",
                    onTap: signUserUp,
                  ),

                  const SizedBox(height: 50),

                  // not a member? register now
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account?',
                        style: TextStyle(color: Theme.of(context).colorScheme.tertiary),
                      ),
                      const SizedBox(width: 4),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: const Text(
                          'Login now',
                          style: TextStyle(
                            color: Color(0xFF00ADB5),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
