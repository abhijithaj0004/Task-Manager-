import 'package:flutter/material.dart';

class TaskFields extends StatelessWidget {
  const TaskFields({
    super.key,
    required this.titleController,
    required this.errorTxt,
    required this.hintTxt,
  });
  final TextEditingController titleController;
  final String errorTxt;
  final String hintTxt;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: titleController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return errorTxt;
        }
        return null;
      },
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          hintText: hintTxt,
          hintStyle: const TextStyle(fontSize: 20)),
    );
  }
}
