import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testam_sa_mearga/models/character.dart';
import 'package:testam_sa_mearga/models/vocation.dart';
import 'package:testam_sa_mearga/screens/create/vocation_card.dart';
import 'package:testam_sa_mearga/screens/home/home.dart';
import 'package:testam_sa_mearga/services/character_store.dart';
import 'package:testam_sa_mearga/shared/styled_button.dart';
import 'package:testam_sa_mearga/shared/styled_text.dart';
import 'package:testam_sa_mearga/theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uuid/uuid.dart';

var uuid = const Uuid();

class CreateScreen extends StatefulWidget {
  const CreateScreen({super.key});

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {

  final _nameController = TextEditingController();
  final _sloganController = TextEditingController();

  @override
  void dispose() {
    // clean up the controller when the widget is disposed
    _nameController.dispose();
    _sloganController.dispose();
    super.dispose();
  }

  //handling vocation selection
  Vocation selectedVocation = Vocation.junkie;

  void updateVocation(Vocation vocation){
    setState(() {
      selectedVocation = vocation;
    });

  }

  // submit handler
  void handleSubmit() {
    if (_nameController.text.trim().isEmpty){
      //show error dialog

      showDialog(context: context, builder: (ctx){
        return AlertDialog(
          backgroundColor: AppColors.secondaryAccent,
          title: const StyledHeading('Missing character name'),
          content: const StyledText('Every good rpg character needs a great name...'),
          actions: [
            StyledButton(
              onPressed: (){
                Navigator.pop(ctx);
              },
              child:StyledHeading('close'),
              ),
          ],
          actionsAlignment: MainAxisAlignment.center,
        );
      });
      return;
    }
    if (_sloganController.text.trim().isEmpty){
      
      showDialog(context: context, builder: (ctx){
        return AlertDialog(
          backgroundColor: AppColors.secondaryAccent,
          title: const StyledHeading('Missing Slogan '),
          content: const StyledText('Remember to add a catchy slogan...'),
          actions: [
            StyledButton(
              onPressed: (){
                Navigator.pop(ctx);
              },
              child:StyledHeading('close'),
              ),
          ],
          actionsAlignment: MainAxisAlignment.center,
        );
      });
      return;
    }
   
         Provider.of<CharacterStore>(context, listen: false)
         .addCharacter(Character(
      name: _nameController.text.trim(),
       slogan: _sloganController.text.trim(),
        vocation: selectedVocation,
         id: uuid.v4(),
         ));

   Navigator.push(context,MaterialPageRoute(builder:(ctx)=>const Home()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const StyledTitle('Character Creation'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
          
              // welcome message
              Center(
                child: Icon(Icons.code, color: AppColors.primaryColor),
              ),
              const Center(
                child: StyledHeading('Welcome, new player.'),
              ),
              const Center(
                child: StyledText('Create a name & slogan for your character.'),
              ),
              const SizedBox(height: 30),
          
              // input for name & slogan
              TextField(
                controller: _nameController,
                cursorColor: AppColors.textColor,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.person_2),
                  label: StyledText('Character name'),
                ),
                style: GoogleFonts.kanit(
                  textStyle: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _sloganController,
                cursorColor: AppColors.textColor,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.chat),
                  label: StyledText('Character slogan'),
                ),
                style: GoogleFonts.kanit(
                  textStyle: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              const SizedBox(height: 30),
              // select vocation title
               Center(
                child: Icon(Icons.code, color: AppColors.primaryColor),
              ),
              const Center(
                child: StyledHeading('Choose a vocation'),
              ),
              const Center(
                child: StyledText('This determines your available skills'),
              ),
              const SizedBox(height: 30),
          
              //vocation cards
              VocationCard(
                selected: selectedVocation == Vocation.junkie,
                onTap:updateVocation,
                vocation: Vocation.junkie,
                ),
              VocationCard(
                 selected: selectedVocation == Vocation.ninja,
                  onTap:updateVocation,
                vocation: Vocation.ninja,
                ),
              VocationCard(
                selected: selectedVocation == Vocation.raider,
                  onTap:updateVocation,
                vocation: Vocation.raider,
                ),
              VocationCard(
                selected: selectedVocation == Vocation.wizard,
                  onTap:updateVocation,
                vocation: Vocation.wizard,
                ),

                //good luck message
            Center(
                child: Icon(Icons.code, color: AppColors.primaryColor),
              ),
              const Center(
                child: StyledHeading('Goodluck'),
              ),
              const Center(
                child: StyledText('And enjoy the journey'),
              ),
              const SizedBox(height: 30),
              // submit button
              Center(
                child: StyledButton(
                  onPressed: handleSubmit, 
                  child: const StyledHeading('Create Character'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}