import 'package:flutter/material.dart';
void showSnackbar(BuildContext context, dynamic message) {
  final snackbar = SnackBar(
    content: Text(message),
    action: SnackBarAction(label: 'Undo', onPressed: () {}),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackbar);
}
