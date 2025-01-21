import 'package:flutter/material.dart';
import 'package:testam_sa_mearga/models/character.dart';
<<<<<<< HEAD
import 'package:testam_sa_mearga/screens/profile/profile.dart';
=======
>>>>>>> c6449a7b6947f1de76ba91762c04d508ab5ef955
import 'package:testam_sa_mearga/shared/styled_text.dart';
import 'package:testam_sa_mearga/theme.dart';

class CharacterCard extends StatelessWidget {
  const CharacterCard(this.character, {super.key});

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            Image.asset('assets/img/vocations/${character.vocation.image}', 
              width: 80
            ),

            const SizedBox(width: 20),
            
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StyledHeading(character.name),
                StyledText(character.vocation.title),
              ]
            ),

            const Expanded(
              child: SizedBox(),
            ),
            
            IconButton(
              onPressed: () {
                // navigate to character profile screen
<<<<<<< HEAD
                  Navigator.push(context, MaterialPageRoute(
                    builder: (ctx)=>Profile(character: character),
                  ));
=======
>>>>>>> c6449a7b6947f1de76ba91762c04d508ab5ef955
              },
              icon: Icon(Icons.arrow_forward, color: AppColors.textColor)
            ),
          ]
        ),
      ),
    );
  }
}