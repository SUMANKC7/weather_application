import 'package:flutter/material.dart';

class LoginInput extends StatelessWidget {
  final String hintText;
  final bool obsecureText;
  const LoginInput({
    super.key,
    required this.hintText,
     required this.obsecureText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obsecureText,
      style: const TextStyle(
        fontSize: 20,
      ),
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(fontSize: 20),
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white))),
              
    );
  }
}
