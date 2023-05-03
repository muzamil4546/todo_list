import 'package:flutter/material.dart';

class taskTagDropDownlist extends StatefulWidget {
  const taskTagDropDownlist({Key? key}) : super(key: key);

  @override
  State<taskTagDropDownlist> createState() => _taskTagDropDownlistState();
}

class _taskTagDropDownlistState extends State<taskTagDropDownlist> {
  _taskTagDropDownlistState(){
    selectedCategory = categories[0];
  }

  String selectedCategory = '';
  List<String> categories = ['Work', ' School', 'other'];
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(labelText: 'Add a task tag'),
          ),
          DropdownButtonFormField(
            decoration: InputDecoration(labelText: 'Category'),
            value: selectedCategory,
            onChanged: (value) {
              setState(() {
                selectedCategory = value!;
              });
            },
            items: [
              DropdownMenuItem(
                value: 'option1',
                child: Text('Work'),
              ),
              DropdownMenuItem(
                value: 'option2',
                child: Text('School'),
              ),
              DropdownMenuItem(
                value: 'option3',
                child: Text('other'),
              ),
            ],
            // categories.map((category) {
            //   return DropdownMenuItem(
            //     value: category,
            //     child: Text(category),
            //   );
            // }).toList(),
          ),
        ],
      ),
    );
  }
  }
