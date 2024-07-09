import 'package:flutter/material.dart';
import 'package:flutter_dialog_sreen/dialog_screen.dart';

void main() {
  runApp(HomeScreen());
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DialogScreen(),
    );
  }
}
