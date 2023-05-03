import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../tasktagdropdownlist.dart';
import '../widgets/customTextField.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final taskNameController = TextEditingController();
  final taskTagController = TextEditingController();
  final taskDesController = TextEditingController();
  final List widgets = [Container(color: Colors.white),Container(color: Colors.black)];
  int selectIndex = 0;
  final firestore = FirebaseFirestore.instance.collection('tasks');
  @override
  Widget build(BuildContext context) {

    var _value = "-1";

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: null,
          title: const Text('To-Do List',style: TextStyle(color: Colors.white),),
          backgroundColor: Colors.brown,
          actions: [
            IconButton(onPressed: (){},
              icon: const Icon(CupertinoIcons.calendar),
            ),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.brown,
          shape: const CircularNotchedRectangle(),
          notchMargin: 5.0,
          clipBehavior: Clip.antiAlias,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(onPressed: (){
                setState(() {
                  selectIndex=0;
                });
                },
                  icon: const Icon(CupertinoIcons.square_list,color: Colors.white,),
                iconSize: 30,
              ),
              IconButton(onPressed: (){
                setState(() {
                  selectIndex=1;
                });
              },
                icon: const Icon(CupertinoIcons.tag,color: Colors.white,),
                iconSize: 30,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.brown,
          onPressed: (){
           showDialog(context: context, builder: (context) =>  AlertDialog(
             // scrollable: true,
             title: const Text(
                 'New Task',
                 textAlign: TextAlign.center,
                 style: TextStyle(
                     color: Colors.brown,
                     fontSize: 20)
             ),
             content: SizedBox(
               height: height * .5,
               width: width,
               child: Form(
                   child: Column(
                     children: [
                       CustomTextField(taskNameController: taskNameController,label: 'Tasks',),
                       const SizedBox(height: 30,),
                       CustomTextField(taskNameController: taskDesController,label: 'Description',),
                       SizedBox(height: 30),
                       CustomTextField(taskNameController: taskTagController,label: 'Add a task tag',),

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
                     ],
                   )),
             ),
             actions: [
               ElevatedButton(
                 onPressed: (){
                   Navigator.of(context).pop();
                 },
                 style: ElevatedButton.styleFrom(primary: Colors.grey),
                 child: const Text(
                     'Cancel',
                     style: TextStyle(
                         color: Colors.white,fontSize: 15)
                 ),
               ),
               ElevatedButton(
                 onPressed: (){
                   firestore.doc().set({
                     'taskName': taskNameController.text.toString(),
                     'taskDesc' : taskDesController.text.toString(),
                     'taskTag' : taskTagController.text.toString(),
                   });
                 },
                 style: ElevatedButton.styleFrom(primary: Colors.brown),
                 child: const Text(
                     'Save',
                     style: TextStyle(
                         color: Colors.white,fontSize: 15)
                 ),
               )
             ],
           ),);
          },
          child: const Icon(CupertinoIcons.add,
            color: Colors.white,)
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: Center(
            child: widgets[selectIndex],
        )
      ),
    );
  }
}

