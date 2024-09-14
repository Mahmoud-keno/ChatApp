import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Textfield extends StatelessWidget {
  // ignore: non_constant_identifier_names
  Textfield(
      {super.key,
      // ignore: non_constant_identifier_names
      required this.text_hint,
      required this.icon,
      required this.onchanged});
  // ignore: non_constant_identifier_names
  String text_hint;
  final IconData icon;
  final Function(String) onchanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (data) {
        if (data!.isEmpty) {
          return 'Field is required';
        }
        return null;
      },
      onChanged: onchanged,
      decoration: InputDecoration(
        icon: Icon(icon),
        hintText: text_hint,
        hintStyle: const TextStyle(
          color: Color(0xff49454F),
          fontFamily: 'Roboto',
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Color(0xffB300FF), width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Color(0xff3000FF), width: 1),
        ),
      ),
    );
  }
}
