import 'package:flutter/material.dart';
import 'package:testproj/models/character.dart';
import 'package:testproj/screens/home/character_card.dart';
import 'package:testproj/shared/styled_button.dart';
import 'package:testproj/shared/styled_text.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const StyledTitle('Your Characters'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: 
                ListView.builder(
                  itemCount: characters.length,
                  itemBuilder: (_,index){
                    return CharacterCard(characters[index]);
                    },
                  ),
                ),
              
                StyledButton(
                onPressed: (){},
                child: StyledHeading('Create new')
                 )
              ],
            ),
        ),
      );
  }
}