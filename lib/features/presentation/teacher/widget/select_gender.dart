import 'package:flutter/material.dart';
import 'package:flutter_school_management_admin_panel/core/constant/app_sized_boxes.dart';
import 'package:flutter_school_management_admin_panel/core/constant/app_text.dart';
import 'package:flutter_school_management_admin_panel/core/constant/app_text_style.dart';
import 'package:flutter_school_management_admin_panel/features/presentation/teacher/widget/right_teacher_sheet.dart';

enum GenderCharacter { male, female }

class SelectGender extends StatefulWidget {
  const SelectGender({super.key, required this.genderCallback});
  final GenderCallback genderCallback;

  @override
  SelectGenderWidget createState() => SelectGenderWidget();
}

class SelectGenderWidget extends State<SelectGender> {
  GenderCharacter _character = GenderCharacter.male;

  @override
  void initState() {
    super.initState();
    widget.genderCallback(_character.name);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          AppText.selectGender,
          style: AppTextStyles.bodySm,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            genderRadioButton(GenderCharacter.male, _character),
            const Text(
              AppText.male,
              style: AppTextStyles.bodySm,
            ),
            AppSizedBoxes.kSizedBoxWidth6,
            genderRadioButton(GenderCharacter.female, _character),
            const Text(
              AppText.female,
              style: AppTextStyles.bodySm,
            ),
          ],
        ),
      ],
    );
  }

  Widget genderRadioButton(value, groupValue) {
    return Radio(
      value: value,
      groupValue: groupValue,
      onChanged: (value) {
        setState(() {
          _character = value;
          widget.genderCallback(_character.name);
        });
      },
    );
  }
}
