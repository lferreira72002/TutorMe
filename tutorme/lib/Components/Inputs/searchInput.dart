import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class searchInput extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final VoidCallback? function;
  final TextInputType keyboard;
  final String label;
  final TextInputAction textInputAction;

  const searchInput({
    super.key,
    this.hintText = '',
    required this.controller,
    this.function,
    this.keyboard = TextInputType.text,
    this.textInputAction = TextInputAction.go,
    this.label = '',
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: TextFormField(
        onTap: function,
        controller: controller,
        keyboardType: keyboard,
        textInputAction: textInputAction,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.never,
          label: Text(label, style: TextStyle(color: Color(0xffC1C1C1))),
          filled: true,
          fillColor: const Color(0xffF6F5EE),
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Color(0xffC1C1C1),
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xffE1E1E1)),
            borderRadius: BorderRadius.circular(25),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xffE1E1E1)),
            borderRadius: BorderRadius.circular(25),
          ),
        ),
      ),
    );
  }
}
