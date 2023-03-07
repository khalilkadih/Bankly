import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final bool isPassword;
  final TextInputType inputType;
  final String placeholder;

  const MyTextField({
    Key? key,
    required this.isPassword,
    required this.inputType,
    required this.placeholder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
        keyboardType: inputType,
        obscureText: isPassword,
        decoration: InputDecoration(
          hintText: placeholder,
          // To delete borders
          enabledBorder: OutlineInputBorder(
            borderSide: Divider.createBorderSide(context),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
          // fillColor: Colors.red,
          filled: true,
          contentPadding: const EdgeInsets.all(8),
        ));
  }
}
