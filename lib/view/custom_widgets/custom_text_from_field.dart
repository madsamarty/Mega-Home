import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomTextFromField extends StatelessWidget {
  final String hint;
  final void Function(String?)? onSave;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final TextInputType txtInType;
  final bool obscure;

  const CustomTextFromField(
      {Key? key,
      required this.hint,
      required this.onSave,
      required this.validator,
      required this.controller,
      this.txtInType = TextInputType.none,
      this.obscure = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hint,
      ),
      keyboardType: TextInputType.visiblePassword,
      obscureText: obscure,
      controller: controller,
      onSaved: onSave,
      validator: validator,
    );
  }
}
