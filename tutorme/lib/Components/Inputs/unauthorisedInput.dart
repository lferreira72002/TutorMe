import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class unauthorisedInput extends StatelessWidget {
  final hint_text;
  final controller;
  final validator;
  final errorText;
  final function;
  final keyboard;
  final List<TextInputFormatter>? formatters;
  final bool isAutoFocus;
  final textInputAction;

  const unauthorisedInput(
      {super.key,
      required this.hint_text,
      required this.controller,
      this.validator = null,
      this.errorText = null,
      this.function = null,
      this.keyboard = TextInputType.text,
      this.formatters,
      this.isAutoFocus = false,
      this.textInputAction = TextInputAction.next});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: TextFormField(
          onTap: () {
            function;
          },
          autofocus: isAutoFocus,
          textInputAction: textInputAction,
          controller: controller,
          inputFormatters: formatters,
          validator: validator,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          keyboardType: keyboard,
          decoration: InputDecoration(
              filled: true,
              fillColor: Color(0xffF6F5EE),
              errorStyle: TextStyle(height: 0),
              hintText: hint_text,
              hintStyle: TextStyle(
                  color: Color(0xffC1C1C1),
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffE1E1E1)),
                  borderRadius: BorderRadius.circular(15)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffE1E1E1)),
                  borderRadius: BorderRadius.circular(15)))),
    );
  }
}
