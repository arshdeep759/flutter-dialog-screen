import 'package:flutter/material.dart';

import 'dialog_pop_up.dart';

class DialogScreen extends StatefulWidget {
  const DialogScreen({super.key});

  @override
  State<DialogScreen> createState() => _DialogScreenState();
}

class _DialogScreenState extends State<DialogScreen> {
  var nameController = TextEditingController();
  var isEnabled = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.amber),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Dialog"),
        ),
        body: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  showDialog(
                      //  barrierColor: Colors.black,
                      barrierDismissible: false,
                      context: context,
                      builder: (context) {
                        return StatefulBuilder(builder: (context, state) {
                          return AlertDialog(
                            title: Text("this is title"),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text("This is content"),
                                Text("This is content 2"),
                                Switch(
                                    value: isEnabled,
                                    onChanged: (value) {
                                      print("value $value");
                                      isEnabled = value;
                                      state(() {});
                                    })
                              ],
                            ),
                            actions: [
                              OutlinedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text("Back"))
                            ],
                          );
                        });
                      });
                },
                child: Text("Alert Dialog")),
            ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          child: Container(
                            color: isEnabled ? Colors.amber : Colors.blue,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text("Custom Dialog"),
                                TextField(
                                  enabled: isEnabled,
                                  controller: nameController,
                                ),
                                ElevatedButton(
                                    onPressed: () {
                                      isEnabled = !isEnabled;
                                      //     alertState(() {});
                                      Navigator.of(context).pop();
                                    },
                                    child: Text("Return"))
                              ],
                            ),
                          ),
                        );
                      });
                },
                child: Text("Custom Dialog")),
            ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context, builder: (context) => DialogPopUp());
                },
                child: Text("Pop up dialog"))
          ],
        ),
      ),
    );
  }
}
