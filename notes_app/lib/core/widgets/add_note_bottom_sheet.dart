import 'package:flutter/material.dart';
import 'package:notes_app/core/constants/app_strings.dart';
import 'package:notes_app/core/widgets/custom_text_field.dart';

import 'custom_button.dart';

class AddNoteBotomSheet extends StatelessWidget {
  const AddNoteBotomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 32),
            CustomTextField(hint: AppStrings.title),
            SizedBox(height: 20),
            CustomTextField(hint: AppStrings.content, maxLines: 6),
            SizedBox(height: 50),
            CustomButton(),
            SizedBox(height:50),
          ],
        ),
      ),
    );
  }
}
