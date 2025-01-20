import 'package:flutter/material.dart';
import 'package:testproj/shared/styled_text.dart';
import 'package:testproj/theme.dart';
import 'package:google_fonts/google_fonts.dart';

class Create extends StatefulWidget {
  const Create({super.key});

  @override
  State<Create> createState() => _CreateState();
}

class _CreateState extends State<Create> {

  final _nameController = TextEditingController();
  final _sloganController = TextEditingController();

  @override
  void dispose() {
    
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const StyledTitle('Character Creation'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: Column(
          children: [
            //welcome message
            Center(
              child: Icon(Icons.code, color: AppColors.primaryColor),
            ),
            const Center(
              child: StyledHeading('Welcome, new player'),
            ),
            const Center(
              child: StyledText('Create a name and a slogan for your character'),
            ),
            const SizedBox(height: 30),

            //input for name and slogan

             TextField(
                controller: _nameController,
                style:GoogleFonts.kanit(
                textStyle: Theme.of(context).textTheme.bodyMedium),
                cursorColor: AppColors.textColor,
                decoration: const InputDecoration(
                prefixIcon: Icon(Icons.person_2),
                label: StyledText('Character name')
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _sloganController,
              style:GoogleFonts.kanit(
              textStyle: Theme.of(context).textTheme.bodyMedium),
              cursorColor: AppColors.textColor,
              decoration: const InputDecoration(
              prefixIcon: Icon(Icons.chat),
              label: StyledText('Character slogan')
              ),
            ),
          ],
        ),
      ),

      );
  }
}