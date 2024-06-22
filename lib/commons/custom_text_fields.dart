import 'package:flutter/material.dart';

typedef ValidatorCallback = String? Function(String? value);

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    required this.controller,
    required this.labelText,
     this.validator,
    super.key,
  });
  final TextEditingController controller;
  final String labelText;
  final ValidatorCallback? validator;
  @override
  Widget build(BuildContext context) {
    const radius = 12.0;

    return TextFormField(
      controller: controller,
       style: const TextStyle(color: Colors.white),
      textCapitalization: TextCapitalization.sentences,
      decoration:  InputDecoration(
        labelText: labelText,

         labelStyle: const TextStyle(color: Colors.white),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
          borderRadius: BorderRadius.all(Radius.circular(radius)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.all(Radius.circular(radius)),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
          borderRadius: BorderRadius.all(Radius.circular(radius)),
        ),
        border: const OutlineInputBorder(
          borderSide:  BorderSide(color: Colors.white),
          borderRadius: BorderRadius.all(Radius.circular(radius)),
        ),
      ),
      validator:validator,
    );
  }
}
