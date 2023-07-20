import 'package:flutter/material.dart';
import 'global_context.dart';

Future<String?> showInputDialog({required String title}) async {
  String? result;
  await showDialog(
    context: scaffoldKey.currentState!.context,
    builder: (context) {
      return Container(
        height: 200,
        width: 200,
        color: Colors.redAccent,
        child: TextFormField(
          decoration: InputDecoration(
            label: Text(title),
          ),
        ),
      );
    },
  );
  return result;
}
