import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../constant/app_colors.dart';

class CommonTextField extends StatelessWidget {
  final TextEditingController controller;
  final bool obsecure;
  final bool readOnly;
  final TextInputType keyboardType;
  final bool isMulti;
  final bool autofocus;
  final bool enabled;
  final String label;
  final String hint;
  final FormFieldValidator<String> validator;

  const CommonTextField({
    Key? key,
    required this.controller,
    required this.label,
    required this.hint,
    required this.validator,
    this.keyboardType = TextInputType.text,
    this.obsecure = false,
    this.isMulti = false,
    this.readOnly = false,
    this.autofocus = false,
    this.enabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: TextFormField(
          inputFormatters: keyboardType == TextInputType.phone ? [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(10),
          ] : [],
          autofocus: autofocus,
          minLines: isMulti ? 4 : 1,
          maxLines: isMulti ? null : 1,
          enabled: enabled,
          readOnly: readOnly,
          obscureText: obsecure,
          keyboardType: keyboardType,
          controller: controller,
          decoration: InputDecoration(
            labelText: label,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
            border: const OutlineInputBorder(),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.primary),
            ),
          ),
          validator: validator,
      ),
    );
  }
}
