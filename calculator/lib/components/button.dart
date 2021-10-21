import 'package:flutter/material.dart';

class CustomElevatedButton extends ElevatedButton {
  CustomElevatedButton(
      {Key? key, required String text, required VoidCallback onPressed})
      : super(
            key: key,
            onPressed: onPressed,
            child: Text(
              text,
              style: const TextStyle(color: Colors.black),
            ));
}
