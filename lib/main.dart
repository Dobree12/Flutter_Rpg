import 'package:flutter/material.dart';
import 'package:testproj/screens/create/create.dart';
import 'package:testproj/screens/home/home.dart';
import 'package:testproj/theme.dart';

void main() {
  runApp( MaterialApp(
    theme: primaryTheme,
    home: Create(),
  ));
}

class SandBox extends StatelessWidget {
  const SandBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SandBox'),
        backgroundColor: Colors.grey,
      ),
      body: Text('sandbox'),
    );
  }
}

enum Priority{low, medium, high, urgent}

Priority p = Priority.medium;