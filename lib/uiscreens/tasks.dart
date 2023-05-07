import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:todo_list/utils/colors.dart';

import '../widgets/delete_task_dialog.dart';
import '../widgets/update_task_alert_dialog.dart';


class Tasks extends StatefulWidget {
  const Tasks({Key? key}) : super(key: key);

  @override
  State<Tasks> createState() => _TasksState();
}

class _TasksState extends State<Tasks> {

  final firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: StreamBuilder<QuerySnapshot>(
        stream: firestore.collection('tasks').snapshots(),
        builder: (context, snapshot) {
          if(!snapshot.hasData) {
    return Text('No tasks to display');
    } else {
            return ListView(
    children: snapshot.data!.docs.map((DocumentSnapshot document) {
    Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
    Color taskColor = AppColors.blueShadeColor;
    var taskTag = data['taskTag'];
    if (taskTag == 'Work') {
    taskColor = AppColors.salmonColor;
    } else if (taskTag == 'School') {
    taskColor = AppColors.greenShadeColor;
    }
    return Container(
    height: 100,
    margin: const EdgeInsets.only(bottom: 15.0),
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(15.0),
    color: Colors.white30,
    boxShadow: const [
    BoxShadow(
    color: AppColors.shadowColor,
    blurRadius: 2.0,
    offset: Offset(0, 5), // shadow direction: bottom right
    ),
    ],
    ),
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListTile(
      leading: Container(
      width: 20,
      height: 40,
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      alignment: Alignment.center,
      child: CircleAvatar(
      backgroundColor: taskColor,
      ),
      ),
      title: Text(data['taskName'],style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
      subtitle: Text(data['taskDesc'],style: TextStyle(height: 1.3),),
      isThreeLine: true,
      trailing: PopupMenuButton(
      itemBuilder: (context) {
      return [
      PopupMenuItem(
      value: 'edit',
      child: const Text(
      'Edit',
      style: TextStyle(fontSize: 13.0),
      ),
      onTap: () {
      String taskId = (data['id']);
      String taskName = (data['taskName']);
      String taskDesc = (data['taskDesc']);
      String taskTag = (data['taskTag']);
      Future.delayed(
      const Duration(seconds: 0),
      () => showDialog(
      context: context,
      builder: (context) => UpdateTaskAlertDialog(taskId: taskId, taskName: taskName, taskDesc: taskDesc, taskTag: taskTag,),
      ),
      );
      },
      ),
      PopupMenuItem(
      value: 'delete',
      child: const Text(
      'Delete',
      style: TextStyle(fontSize: 13.0),
      ),
      onTap: (){
      String taskId = (data['id']);
      String taskName = (data['taskName']);
      Future.delayed(
      const Duration(seconds: 0),
      () => showDialog(
      context: context,
      builder: (context) => DeleteTaskDialog(taskId: taskId, taskName:taskName),
      ),
      );
      },
      ),
      ];
      },
      ),
      dense: true,
      ),
    ),
    );
    }).toList());
    }
          }
      ),
    );
  }
}