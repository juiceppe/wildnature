import 'package:flutter/material.dart';

class RegistrationField {
  Widget emailRegistrationField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Email",
        fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white, width: 2.0),
          borderRadius: BorderRadius.circular(25.0),
        ),
      ),
    );
  }
}
