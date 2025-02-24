import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'package:testam_sa_mearga/screens/create/create.dart';
import 'package:testam_sa_mearga/screens/home/home.dart';
import 'package:testam_sa_mearga/services/character_store.dart';
//import 'package:testam_sa_mearga/screens/home/home.dart';
import 'package:testam_sa_mearga/theme.dart';


//firebase stuff
import 'package:firebase_core/firebase_core.dart';
import 'shared/firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(ChangeNotifierProvider(
    create : (context)=> CharacterStore(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: primaryTheme,
      home: const Home(),
    ),
  ));
}

