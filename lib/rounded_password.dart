  
import 'package:flutter/material.dart';
import './text_field_container.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const RoundedPasswordField({
    Key key,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: true,
        onChanged: onChanged,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          hintText: "Password",
          icon: Icon(
            Icons.lock_outline,
            color: Colors.indigo,
          ),
          suffixIcon: Icon(
            Icons.visibility,
            color: Colors.indigo[400],
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}