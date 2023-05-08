import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final IconData? icon;
  final IconData? suffixIcon;
  final TextInputType? keyboardType;
  final bool passwordText;

  final String formProperty;
  final Map<String, dynamic> formValues;

  const CustomInputField({
    super.key,
    this.hintText,
    this.labelText,
    this.helperText,
    this.icon,
    this.suffixIcon,
    this.keyboardType,
    this.passwordText = false,
    required this.formProperty,
    required this.formValues,
  });

  bool isValidEmail(String email) {
    return RegExp(
            r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
        .hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // autofocus: true,
      initialValue: '',
      textCapitalization: TextCapitalization.words,
      keyboardType: keyboardType ?? TextInputType.text,
      obscureText: passwordText,
      onChanged: (value) {
        formValues[formProperty] = value;
      },
      validator: (value) {
        if (value == null) return 'This field is mandatory';
        if (keyboardType == TextInputType.emailAddress &&
            !isValidEmail(value)) {
          return 'You must insert a valid email';
        }
        return value.length < 3 ? '3 minimum characters' : null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
          hintText: hintText,
          labelText: labelText,
          helperText: helperText,
          suffixIcon: suffixIcon == null
              ? null
              : Icon(
                  suffixIcon,
                ),
          icon: icon == null
              ? null
              : Icon(
                  icon,
                )),
    );
  }
}
