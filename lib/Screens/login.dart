import 'package:firebase_auth/firebase_auth.dart';
import 'package:ibls/components/my_button.dart';
import 'package:ibls/components/my_textfield.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text editing controllers
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final bgColor = const Color(0xFF222831);
  final primaryColor = const Color(0xFFEEEEEE);

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

  // sign user in method
  void signUserIn() async {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      Navigator.pop(context);
    }
    on FirebaseAuthException catch(e){
      Navigator.pop(context);
      if(e.code == "user-not-found"){
        wrongInfo(e.message.toString());
      }
      else if(e.code == "wrong-password"){
        wrongInfo(e.message.toString());
      }
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
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 100),

                    // logo
                    Icon(
                      Icons.lock,
                      color: Theme.of(context).colorScheme.tertiary,
                      size: 100,
                    ),

                    const SizedBox(height: 50),

                    // welcome back, you've been missed!
                    Text(
                      'Welcome back you\'ve been missed!',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.tertiary,
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    ),

                    const SizedBox(height: 25),

                    // email textfield
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
                      controller: passwordController,
                      hintText: 'Password',
                      obscureText: true,
                      type: TextInputType.visiblePassword,
                      icon: Icons.key,
                    ),

                    const SizedBox(height: 10),

                    // forgot password?
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          Text(
                            'Forgot Password?',
                            style: TextStyle(
                                color: Color(0xFF00ADB5),
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 25),

                    // sign in button
                    MyButton(
                      text: "Sign In",
                      onTap: signUserIn,
                    ),

                    const SizedBox(height: 60),

                    // not a member? register now
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Not a member?',
                          style: TextStyle(color: Color(0xFFEEEEEE)),
                        ),
                        const SizedBox(width: 4),
                        GestureDetector(
                          onTap: widget.onTap,
                          child: const Text(
                            'Register now',
                            style: TextStyle(
                              color: Color(0xFF00ADB5),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
