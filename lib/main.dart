import 'package:flutter/material.dart';
import 'package:testam_sa_mearga/screens/create/create.dart';
import 'package:testam_sa_mearga/screens/home/home.dart';
import 'package:testam_sa_mearga/screens/home/home.dart';
import 'package:testam_sa_mearga/theme.dart';

void main() {
  runApp(MaterialApp(
    theme: primaryTheme,
    home: const Home(),
  ));
}

// sandbox
class Sandbox extends StatelessWidget {
  const Sandbox({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sandbox'),
        backgroundColor: Colors.grey,
      ),
      body: const Text('sandbox'),
    );
  }
}