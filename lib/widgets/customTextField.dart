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

// TextFormField(
//     controller: taskDesController,
//     keyboardType: TextInputType.multiline,
//     maxLines: 2 ,
//     style: const TextStyle(fontSize: 16),
//     decoration: InputDecoration(
//         enabledBorder: OutlineInputBorder(
//             borderSide: const BorderSide(
//                 color: Colors.brown),
//             borderRadius: BorderRadius.circular(20)
//         ),
//         focusedBorder: OutlineInputBorder(
//             borderSide: const BorderSide(
//                 color: Colors.brown),
//             borderRadius: BorderRadius.circular(20)
//         ),
//         contentPadding: const EdgeInsets.symmetric(
//             vertical: 20,
//             horizontal: 20),
//         hintText: 'Description',
//         icon: const Icon(CupertinoIcons.bubble_left_bubble_right,color: Colors.brown,),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(20),
//         )
//     )
// ),
// TextFormField(
//     controller: taskTagController,
//     style: const TextStyle(fontSize: 16),
//     decoration: InputDecoration(
//         enabledBorder: OutlineInputBorder(
//             borderSide: const BorderSide(
//                 color: Colors.brown),
//             borderRadius: BorderRadius.circular(20)
//         ),
//         focusedBorder: OutlineInputBorder(
//             borderSide: const BorderSide(
//                 color: Colors.brown),
//             borderRadius: BorderRadius.circular(20)
//         ),
//         contentPadding: const EdgeInsets.symmetric(
//             vertical: 20,
//             horizontal: 20),
//         hintText: 'Add a task tag',
//         icon: const Icon(CupertinoIcons.tag,color: Colors.brown,),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(20),
//         )
//     )
// ),
// DropdownButtonFormField(
//     decoration: InputDecoration(
//         focusedBorder: OutlineInputBorder(
//                       borderSide: BorderSide(
//                           color: Colors.brown),
//                       borderRadius: BorderRadius.circular(20)
//                   ),
//         labelText: 'Add a task tag',labelStyle: TextStyle(color: Colors.brown),
//       icon: Icon(CupertinoIcons.tag,color: Colors.brown,),
//       border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(20),
//                 )
//     ),
//     value: _value,
//     items: [
//       DropdownMenuItem(child: Text('School'),value:"-1" ),
//       DropdownMenuItem(child: Text('College'),value:"1" ),
//       DropdownMenuItem(child: Text('University'),value:"2" ),
//       DropdownMenuItem(child: Text('other'),value:"3" ),
//     ],
//     onChanged: (v){},
// )