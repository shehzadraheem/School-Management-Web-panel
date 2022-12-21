import 'package:flutter/material.dart';
import 'package:flutter_school_management_admin_panel/features/presentation/teacher/widget/right_teacher_sheet.dart';

class SelectBloodGroup extends StatefulWidget {
  const SelectBloodGroup({Key? key, required this.bloodGroupCallback}) : super(key: key);

  final BloodGroupCallback bloodGroupCallback;

  @override
  State<SelectBloodGroup> createState() => _SelectBloodGroupState();
}

class _SelectBloodGroupState extends State<SelectBloodGroup> {
  // Initial Selected Value
  String initialValue = 'A+';

  // List of items in our dropdown menu
  var groups = [
    'A+',
    'A-',
    'B+',
    'B-',
    'O+',
    'O-',
    'AB+',
    'AB-',
  ];

  @override
  void initState() {
    super.initState();
    widget.bloodGroupCallback(initialValue);
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      // Initial Value
      value: initialValue,
      // Down Arrow Icon
      icon: const Icon(Icons.keyboard_arrow_down),
      // Array list of items
      items: groups.map((String items) {
        return DropdownMenuItem(
          value: items,
          child: Text(items),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          initialValue = newValue!;
          widget.bloodGroupCallback(newValue);
        });
      },
    );
  }
}
