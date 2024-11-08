import 'package:flutter/material.dart';

class StatefulBuilderExample extends StatelessWidget {
  const StatefulBuilderExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('StatefulBuilder Example')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                bool isChecked = false;

                return AlertDialog(
                  title: const Text('Accept Terms'),
                  content: StatefulBuilder(
                    builder: (BuildContext context, StateSetter setState) {
                      return CheckboxListTile(
                        title: const Text("I accept the terms and conditions"),
                        value: isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value ?? false;
                          });
                        },
                      );
                    },
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Close'),
                    ),
                  ],
                );
              },
            );
          },
          child: const Text('Open Dialog'),
        ),
      ),
    );
  }
}