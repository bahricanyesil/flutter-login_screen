import 'package:flutter/material.dart';
import './text_field_container.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const RoundedInputField({
    Key key,
    this.hintText,
    this.icon = Icons.mail_outline,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: Colors.indigo,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}