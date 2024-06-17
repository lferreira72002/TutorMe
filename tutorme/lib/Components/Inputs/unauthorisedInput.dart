import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class unauthorisedInput extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String? errorText;
  final VoidCallback? function;
  final TextInputType keyboard;
  final List<TextInputFormatter>? formatters;
  final bool isAutoFocus;
  final TextInputAction textInputAction;
  final bool isObscure;

  const unauthorisedInput({
    super.key,
    required this.hintText,
    required this.controller,
    this.validator,
    this.errorText,
    this.function,
    this.keyboard = TextInputType.text,
    this.formatters,
    this.isAutoFocus = false,
    this.textInputAction = TextInputAction.next,
    this.isObscure = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: TextFormField(
        onTap: function,
        autofocus: isAutoFocus,
        textInputAction: textInputAction,
        controller: controller,
        inputFormatters: formatters,
        validator: validator,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: keyboard,
        obscureText: isObscure,
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xffF6F5EE),
          errorStyle: const TextStyle(height: 0),
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Color(0xffC1C1C1),
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xffE1E1E1)),
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xffE1E1E1)),
            borderRadius: BorderRadius.circular(15),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xffFF9494)),
            borderRadius: BorderRadius.circular(15),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xffFF9494)),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}
