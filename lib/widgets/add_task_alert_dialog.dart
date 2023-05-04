import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'customTextField.dart';

class AddTaskAlertDialog extends StatefulWidget {
  const AddTaskAlertDialog({Key? key}) : super(key: key);

  @override
  State<AddTaskAlertDialog> createState() => _AddTaskAlertDialogState();
}

class _AddTaskAlertDialogState extends State<AddTaskAlertDialog> {
  // final taskTagController = TextEditingController();

  final taskNameController = TextEditingController();
  final taskDesController = TextEditingController();
  final List<String> taskTags = ['Work', 'School', 'Other'];
  String selectedValue = '';

  final firestore = FirebaseFirestore.instance.collection('tasks');

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return AlertDialog(
      scrollable: true,
      title: const Text('New Task',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.brown, fontSize: 20)),
      content: SizedBox(
        height: height * .5,
        width: width,
        child: Form(
            child: Column(
          children: [
            TextFormField(
                controller: taskNameController,
                style: const TextStyle(fontSize: 16),
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(20)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.brown),
                        borderRadius: BorderRadius.circular(20)),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 20),
                    hintText: 'Task',
                    icon: const Icon(
                      CupertinoIcons.square_list,
                      color: Colors.brown,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ))),
            const SizedBox(
              height: 30,
            ),
            TextFormField(
                controller: taskDesController,
                keyboardType: TextInputType.multiline,
                maxLines: 2,
                style: const TextStyle(fontSize: 16),
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.brown),
                        borderRadius: BorderRadius.circular(20)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.brown),
                        borderRadius: BorderRadius.circular(20)),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 20),
                    hintText: 'Description',
                    icon: const Icon(
                      CupertinoIcons.bubble_left_bubble_right,
                      color: Colors.brown,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ))),
            SizedBox(height: 30),
            Expanded(child: DropdownButtonFormField(
                  decoration: InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.zero,
              border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            ),
                isExpanded: true,
                hint: const Text(
                  'Add a task tag',
                  style: TextStyle(fontSize: 14),
                ),
                // buttonHeight: 60,
                // buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                // dropdownDecoration: BoxDecoration(
                //   borderRadius: BorderRadius.circular(15),
                // ),
                items: taskTags.map((item) => DropdownMenuItem<String>(value: item,child: Text(item,style: const TextStyle(fontSize: 14,),),)).toList(),
                onChanged: (String? value) => setState(() {
              if (value != null) selectedValue = value;
            },))
            // TextFormField(
            //     style: const TextStyle(fontSize: 16),
            //     decoration: InputDecoration(
            //         enabledBorder: OutlineInputBorder(
            //             borderSide: const BorderSide(color: Colors.brown),
            //             borderRadius: BorderRadius.circular(20)),
            //         focusedBorder: OutlineInputBorder(
            //             borderSide: const BorderSide(color: Colors.brown),
            //             borderRadius: BorderRadius.circular(20)),
            //         contentPadding: const EdgeInsets.symmetric(
            //             vertical: 20, horizontal: 20),
            //         hintText: 'Add a task tag',
            //         icon: const Icon(
            //           CupertinoIcons.tag,
            //           color: Colors.brown,
            //         ),
            //         border: OutlineInputBorder(
            //           borderRadius: BorderRadius.circular(20),
            //         ))),
            )],
        )),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          style: ElevatedButton.styleFrom(primary: Colors.grey),
          child: const Text('Cancel',
              style: TextStyle(color: Colors.white, fontSize: 15)),
        ),
        ElevatedButton(
          onPressed: () {
            firestore.doc().set({
              'taskName': taskNameController.text.toString(),
              'taskDesc': taskDesController.text.toString(),
              'taskTags': selectedValue
            });
          },
          style: ElevatedButton.styleFrom(primary: Colors.brown),
          child: const Text('Save',
              style: TextStyle(color: Colors.white, fontSize: 15)),
        )
      ],
    );
  }
}
