import 'package:flutter/material.dart';
import 'package:testam_sa_mearga/models/character.dart';
import 'package:testam_sa_mearga/models/skill.dart';
import 'package:testam_sa_mearga/shared/styled_text.dart';
import 'package:testam_sa_mearga/theme.dart';

class SkillList extends StatefulWidget {
  const SkillList(this.character,{super.key});
  final Character character;
  @override
  State<SkillList> createState() => _SkillListState();
}

class _SkillListState extends State<SkillList> {

  late List<Skill> availableSkills;
  late Skill selectedSkill;

  @override
  void initState() {
    
   availableSkills  = allSkills.where((skill){
    return skill.vocation == widget.character.vocation;
  }).toList();

    if(widget.character.skills.isEmpty){
      selectedSkill = availableSkills[0];
    }
    if(widget.character.skills.isNotEmpty){
      selectedSkill = widget.character.skills.first;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:EdgeInsets.all(16),
      child: Container(
        padding: EdgeInsets.all(16),
        color: AppColors.secondaryColor.withOpacity(0.3),
        child: Column(
          children: [
            StyledHeading('Choose an active skill'),
            StyledText('Skills are unique to your vocation'),
            SizedBox(height: 20),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: availableSkills.map((skill){
                  return Container(
                    margin: EdgeInsets.all(5),
                    padding: EdgeInsets.all(2),
                    color: skill == selectedSkill ? Colors.yellow : Colors.transparent,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.character.updateSkills(skill);
                          selectedSkill = skill;
                        });
                      },
                      child: Image.asset('assets/img/skills/${skill.image}',
                      width: 60,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 10),
            StyledText(selectedSkill.name),
          ],
        ),
      ),
      );
  }
}