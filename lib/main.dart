import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'package:testam_sa_mearga/screens/create/create.dart';
import 'package:testam_sa_mearga/screens/home/home.dart';
import 'package:testam_sa_mearga/services/character_store.dart';
//import 'package:testam_sa_mearga/screens/home/home.dart';
import 'package:testam_sa_mearga/theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create : (context)=> CharacterStore(),
    child: MaterialApp(
      theme: primaryTheme,
      home: const Home(),
    ),
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