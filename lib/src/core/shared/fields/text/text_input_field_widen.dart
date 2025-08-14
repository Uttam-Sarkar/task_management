import 'package:flutter/material.dart';

class KTextInputFieldWiden extends StatelessWidget {
  final String title;
  final bool enabled;
  final TextEditingController? controller;
  final String? initialValue;
  final FormFieldValidator<String>? validator;
  final bool required;

  const KTextInputFieldWiden({
    super.key,
    required this.title,
    this.enabled = true,
    this.controller,
    this.initialValue,
    this.validator,
    this.required = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      initialValue: initialValue,
      enabled: enabled,

      // style: Theme.of(context).textTheme.bodyMedium,
      textAlign: TextAlign.start,
      validator:
          validator ??
          (value) {
            if (required && (value == null || value.trim().isEmpty)) {
              return 'This Field is required';
            }
            return null;
          },
      decoration: InputDecoration(
        label: Text.rich(
          TextSpan(
            text: title,
            children: [
              if (required)
                TextSpan(
                  text: " *",
                  style: TextStyle(color: Colors.red),
                ),
            ],
          ),
        ),
        filled: true,
        fillColor: Colors.deepOrange.withValues(alpha: 0.05),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        
        border: _border(Colors.blueAccent),
        disabledBorder: _border(Colors.blueAccent),
        focusedBorder: _border(Colors.blueAccent),
        errorBorder: _border(Colors.red),
        focusedErrorBorder: _border(Colors.red),
        counter: const SizedBox.shrink(),

        
        
      ),
    );
  }
  
  OutlineInputBorder _border(Color color) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: color, width: 1),
      borderRadius: BorderRadius.circular(8),
    );
  }
}
