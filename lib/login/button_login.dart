import 'package:flutter/material.dart';
import 'package:weather_application/utils/routes.dart';

class LoginButton extends StatelessWidget {
  final String login;
  const LoginButton({
    super.key,
    required this.login,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MaterialButton(
        onPressed: () {
          Navigator.pushNamed(context, MyRoutes.homePage);
        },
        elevation: 10,
        color: const Color.fromARGB(255, 92, 90, 90),
        height: 50,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Text(
          login,
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
