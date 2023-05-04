import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../tasktagdropdownlist.dart';
import '../widgets/add_task_alert_dialog.dart';
import '../widgets/customTextField.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  final List widgets = [Container(color: Colors.white),Container(color: Colors.black)];
  int selectIndex = 0;
  @override
  Widget build(BuildContext context) {

    var _value = "-1";
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
           showDialog(context: context, builder: (context) =>  AddTaskAlertDialog());
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

