


import 'package:flutter/material.dart';

class PasswordTextFormField extends StatelessWidget {
  final bool obserText;
  final TextEditingController? controller;
  final String name;
  final String? Function(String?)? validator;

  final Function onTap;
  const PasswordTextFormField({super.key, 
     this.controller,
    required this.validator,
    required this.onTap,
    required this.name,
    required this.obserText,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: obserText,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        hintText: name,
        suffixIcon: GestureDetector(
          onTap:()=> onTap(),
          child: Icon(
            obserText == false ? Icons.visibility : Icons.visibility_off,
            color: Colors.black,
          ),
        ),
        hintStyle: const TextStyle(color: Colors.black),
      ),
    );
  }
}