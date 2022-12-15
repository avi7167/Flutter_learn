import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_app_1/components/my_button.dart';
import 'package:login_app_1/components/square_tile.dart';
import 'package:login_app_1/components/text_field.dart';

// class LoginPage extends StatelessWidget {
//   const LoginPage({super.key});

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text editing controller
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  // sign user in method: empty method will look at this later
  void signUserIn() async {
    // show loading circle while logging in
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });

    // Sign in with username and pass
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        wrongEmailMessage();
        // print('User not found for the email');
      } else if (e.code == 'wrong-password') {
        wrongPasswordMessage();
        // print('password is wrong');
      }
    }

    // pop the loading sign out
  }

//  wrong credentials messages pop up
  void wrongEmailMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          title: Text('Incorrect email or password'),
        );
      },
    );
  }

  void wrongPasswordMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          title: Text('Incorrect email or password'),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              //  main logo
              const Icon(
                Icons.lock,
                size: 100,
              ),

              const SizedBox(height: 50),

              //  welcome back
              Text(
                'Welcome back you\'ve been missed! ',
                style: TextStyle(color: Colors.grey.shade700, fontSize: 16),
              ),

              const SizedBox(height: 25),
              //  username
              MyTextField(
                controller: emailController,
                hintText: 'Enter email',
                obscureText: false,
              ),
              //  pass
              const SizedBox(
                height: 15,
              ),
              MyTextField(
                controller: passwordController,
                hintText: 'Enter password',
                obscureText: true,
              ),
              const SizedBox(
                height: 10,
              ),

              // Forgot Pass
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 26),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forgot Password?',
                      style: TextStyle(color: Colors.grey.shade600),
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: 25,
              ),
              //  signin button
              MyButton(
                onTap: signUserIn,
              ),

              const SizedBox(
                height: 25,
              ),

              //  or continue with
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(
                        child: Divider(
                      thickness: 0.5,
                      color: Colors.grey.shade400,
                    )),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'or continue with',
                        style: TextStyle(color: Colors.grey.shade700),
                      ),
                    ),
                    Expanded(
                        child: Divider(
                      thickness: 0.5,
                      color: Colors.grey.shade400,
                    )),
                  ],
                ),
              ),
              //  google / apple signin buttons
              const SizedBox(height: 45),
              // start coding from here
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const SquareTile(imagePath: 'lib/images/google.png'),
                  const SizedBox(width: 10),
                  const SquareTile(imagePath: 'lib/images/apple.png'),
                ],
              ),
              // not a member? register now
              const SizedBox(height: 30),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Text('Not a member?'),
                  const SizedBox(width: 4),
                  const Text(
                    'Register now',
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
