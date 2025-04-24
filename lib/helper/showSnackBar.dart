import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    new SnackBar(
      content: new Text(message),
    ),
  );
}
