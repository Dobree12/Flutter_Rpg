import 'package:flutter/material.dart';
import 'package:testproj/models/character.dart';
import 'package:testproj/shared/styled_text.dart';
import 'package:testproj/theme.dart';

class CharacterCard extends StatelessWidget {
  const CharacterCard(this.character,{super.key});

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            Image.asset('assets/img/vocations/${character.vocation.image}',
            width: 80,
            ),

            SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StyledHeading(character.name),
                StyledText(character.vocation.title),
                
              ],
            ),

            const Expanded(
              child: SizedBox(),
            ),
            IconButton(
              onPressed: (){}, 
              icon: Icon(Icons.arrow_forward_ios, color: AppColors.textColor,))
              
          ],
        ),
      ),
    );
  }
}