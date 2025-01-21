import 'package:flutter/material.dart';
import 'package:testam_sa_mearga/models/character.dart';
import 'package:testam_sa_mearga/screens/profile/skill_list.dart';
import 'package:testam_sa_mearga/screens/profile/stats_table.dart';
import 'package:testam_sa_mearga/shared/styled_button.dart';
import 'package:testam_sa_mearga/shared/styled_text.dart';
import 'package:testam_sa_mearga/theme.dart';

class Profile extends StatelessWidget {
  const Profile({
    super.key,
    required this.character,
  });

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StyledTitle(character.name)
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // basic info - image, vocation, description
            Container(
              padding: const EdgeInsets.all(16),
              color: AppColors.secondaryColor.withOpacity(0.3),
              child: Row(
                children: [
                  Image.asset('assets/img/vocations/${character.vocation.image}',
                    width: 140,
                    height: 140,
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        StyledHeading(character.vocation.title),
                        StyledText(character.vocation.description),
                      ],
                    ),
                  )
                ],
              ),
            ),
            // weapon and ability
            SizedBox(height: 20),
            Center(child: Icon(Icons.code, color: AppColors.primaryColor)),
            Padding(
              padding:EdgeInsets.all(16),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(16),
                color: AppColors.secondaryColor.withOpacity(0.3),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    StyledHeading('Slogan'),
                    StyledText(character.slogan),
                    SizedBox(height: 10),
                    StyledHeading('Weapon'),
                    StyledText(character.vocation.weapon),
                    SizedBox(height: 10),
                    StyledHeading('Unique Ability'),
                    StyledText(character.vocation.ability),
                    SizedBox(height: 10),
                  ],
                ),
              ),
              ),

            // stats & skills
            Container(
              alignment: Alignment.center,
              child: Column(
                children: [
                  StatsTable(character),
                  SkillList(character),
                ],
              ),
            ),
            // save button
            StyledButton(
              onPressed: (){
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content:StyledHeading('Character was saved'),
                  showCloseIcon: true,
                  duration: Duration(seconds: 2),
                  backgroundColor: AppColors.secondaryColor,
                ));
              },
               child: StyledHeading('Save Character'),
               ),
               SizedBox(height: 20)

          ],
        ),
      ),
    );
  }
}