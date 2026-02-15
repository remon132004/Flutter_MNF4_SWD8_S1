import 'package:flutter/material.dart';

import '../constants/app_strings.dart';
import 'custom_text_field.dart';

class EditNoteBody extends StatelessWidget {
  const EditNoteBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          CustomTextField(hint: AppStrings.title),
          SizedBox(height: 20),
          CustomTextField(hint: AppStrings.content, maxLines: 5),
        ],
      ),
    );
  }
}
