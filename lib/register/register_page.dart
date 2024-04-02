import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:weather_application/login/button_login.dart';
import 'package:weather_application/login/login_input.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 25, left: 25, right: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Title
                Title(
                    color: Colors.white,
                    child: const Text(
                      "Welcome !",
                      style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    )),
                const SizedBox(
                  height: 12,
                ),
          
                //Icon
                const Center(
                  child: Icon(
                    Icons.cloud,
                    size: 150,
                    color: Color.fromARGB(255, 178, 214, 243),
                  ),
                ),
                //Email text
                const Text(
                  "Email",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
          
                //Email box
                const SizedBox(
                  height: 10,
                ),
                const LoginInput(
                  hintText: "Enter Username",
                  obsecureText: false,
                ),
                const SizedBox(
                  height: 15,
                ),
          
                //Password text
                const Text(
                  "Password",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
          
                //Password box
                const SizedBox(
                  height: 10,
                ),
                const LoginInput(
                  hintText: "Enter Password",
                  obsecureText: true,
                ),
                const SizedBox(
                  height: 15,
                ),
                 //Confirm Password text
                const Text(
                  "Confirm Password",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
          
                //Confirm Password box
                const SizedBox(
                  height: 10,
                ),
                const LoginInput(
                  hintText: "ConfirmPassword",
                  obsecureText: true,
                ),
                const SizedBox(
                  height: 15,
                ),
                
          
                 
          
                //Register Button
                const LoginButton(login: "Register",),
          
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}

