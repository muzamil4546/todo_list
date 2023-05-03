import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.taskNameController, this.label
  });

  final TextEditingController taskNameController;
 final String? label;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: taskNameController,
        style: const TextStyle(fontSize: 16),
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    color: Colors.grey),
                borderRadius: BorderRadius.circular(20)
            ),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    color: Colors.brown),
                borderRadius: BorderRadius.circular(20)
            ),
            contentPadding: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 20),
            hintText: label ?? 'Task',
            icon: const Icon(CupertinoIcons.square_list,color: Colors.brown,),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            )
        )
    );
  }
}
