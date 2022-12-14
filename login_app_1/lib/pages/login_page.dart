import 'package:flutter/material.dart';
import 'package:login_app_1/components/my_button.dart';
import 'package:login_app_1/components/square_tile.dart';
import 'package:login_app_1/components/text_field.dart';

// class LoginPage extends StatelessWidget {
//   const LoginPage({super.key});

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  // text editing controller
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  // sign user in method: empty method will look at this later
  void signUserIn() {}

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
                controller: usernameController,
                hintText: 'Username',
                obscureText: false,
              ),
              //  pass
              const SizedBox(
                height: 20,
              ),
              MyTextField(
                controller: passwordController,
                hintText: 'Password',
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
