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

  final TextEditingController taskNameController = TextEditingController();
  final TextEditingController taskDescController = TextEditingController();
  final List<String> taskTag = ['Work', 'School', 'Other'];
  String selectedValue = '';

  // final firestore = FirebaseFirestore.instance.collection('tasks');

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
                controller: taskDescController,
                keyboardType: TextInputType.multiline,
                maxLines: 2,
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
                    hintText: 'Description',
                    icon: const Icon(
                      CupertinoIcons.bubble_left_bubble_right,
                      color: Colors.brown,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ))),
            SizedBox(height: 30),
            Row(children: [
              Icon(CupertinoIcons.tag,color: Colors.brown,),
            SizedBox(width: 15),
            Expanded(child: DropdownButtonFormField(
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.brown),
                borderRadius: BorderRadius.circular(20),
              ),
              isDense: true,
              contentPadding: EdgeInsets.fromLTRB(20, 20, 20, 20),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            isExpanded: true,
            hint: const Text(
              'Add a task tag',
              style: TextStyle(fontSize: 15),
            ),
            items: taskTag.map((item) => DropdownMenuItem<String>
              (value: item,
              child: Text(item,
                style: const TextStyle(
                  fontSize: 14,),
            ),
            )).toList(),
            onChanged: (String? value) => setState(() {
              if (value != null) selectedValue = value;
            },))
            )]
            )],
        ),
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.grey,
          ),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            final taskName = taskNameController.text;
            final taskDesc = taskDescController.text;
            final taskTag = selectedValue;
            _addTasks(taskName: taskName, taskDesc: taskDesc, taskTag: taskTag);
            Navigator.of(context, rootNavigator: true).pop();
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.brown,
          ),
          child: const Text('Save',),
        ),
      ],
    );
  }

  Future _addTasks({required String taskName, required String taskDesc, required String taskTag}) async {
    DocumentReference docRef = await FirebaseFirestore.instance.collection('tasks').add(
      {
        'taskName': taskName,
        'taskDesc': taskDesc,
        'taskTag': taskTag,
      },
    );
    String taskId = docRef.id;
    await FirebaseFirestore.instance.collection('tasks').doc(taskId).update(
      {'id': taskId},
    );
    _clearAll();
  }

  void _clearAll() {
    taskNameController.text = '';
    taskDescController.text = '';
  }
}