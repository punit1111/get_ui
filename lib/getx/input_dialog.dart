import 'package:flutter/material.dart';
import 'global_context.dart';

TextEditingController _inputController = TextEditingController();

Future<String?> showInputDialog({required String title}) async {
  String? result;
  GlobalKey<FormState> formKey = GlobalKey();
  await showDialog(
    context: navigatorKey.currentState!.context,
    builder: (context) {
      return SimpleDialog(
        title: Text(title),
        children: [
          Container(
            padding: const EdgeInsets.all(25),
            child: Column(
              children: [
                Form(
                  key: formKey,
                  child: TextFormField(
                    controller: _inputController,
                    validator: (input) {
                      if (input?.isEmpty ?? false) {
                        return 'invalid input';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 25),
                TextButton(
                  onPressed: () {
                    if (formKey.currentState?.validate() ?? false) {
                      result = _inputController.text.trim();
                      _inputController.clear();
                      Navigator.pop(navigatorKey.currentState!.context);
                    }
                  },
                  child: const Text('Submit'),
                ),
              ],
            ),
          ),
        ],
      );
    },
  );
  return result;
}

Future<String?> showInputDialogMenu(
    {required String title,
    required List<String> options,
    required String defaultOption}) async {
  String dropdownValue = defaultOption;

  await showDialog(
    context: navigatorKey.currentState!.context,
    builder: (BuildContext context) {
      return SimpleDialog(
        title: Text(title),
        children: [
          StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Column(
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: List<Widget>.generate(
                      options.length,
                      (int index) {
                        return RadioListTile<String>(
                          value: options[index],
                          title: Text(options[index]),
                          groupValue: dropdownValue,
                          onChanged: (String? value) {
                            setState(() => dropdownValue = value!);
                          },
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 25),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(navigatorKey.currentState!.context);
                    },
                    child: const Text('Submit'),
                  ),
                ],
              );
            },
          )
        ],
      );
    },
  );
  return dropdownValue;
}
