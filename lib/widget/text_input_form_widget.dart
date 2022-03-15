import 'package:flutter/material.dart';

class TextInputField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool obscureText;
  final String? obscuringCharacter;
  final ValueChanged<String>? onFieldSubmitted;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;

  const TextInputField({
    Key? key,
    required this.labelText,
    required this.hintText,
    this.focusNode,
    this.controller,
    this.keyboardType,
    this.obscureText = false,
    this.obscuringCharacter,
    this.onFieldSubmitted,
    this.onSaved,
    this.validator, this.textInputAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(width: 2, color: Colors.white),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.pinkAccent, width: 2.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(width: 2, color: Colors.lime),
        ),
        focusColor: Colors.lime,
        labelText: labelText,
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.headline1,
        labelStyle: const TextStyle(fontSize: 20, color: Colors.white),
      ),
      obscureText: obscureText,
      obscuringCharacter: obscuringCharacter ?? '•',
      style: Theme.of(context).textTheme.headline2,
      keyboardType: TextInputType.emailAddress,
      controller: controller,
      focusNode: focusNode,
      textInputAction: TextInputAction.next,
      onFieldSubmitted: onFieldSubmitted,
      onSaved: onSaved,
      validator: validator,
    );
  }
}
