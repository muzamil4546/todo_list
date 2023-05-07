import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DeleteTaskDialog extends StatefulWidget {

  final String taskName, taskId;

  const DeleteTaskDialog({Key? key,required this.taskName,required this.taskId}) : super(key: key);

  @override
  State<DeleteTaskDialog> createState() => _DeleteTaskDialogState();
}

class _DeleteTaskDialogState extends State<DeleteTaskDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      title: Text('Delete Task',
        textAlign: TextAlign.center,style: TextStyle(fontSize: 16,color: Colors.brown),),
      content: SizedBox(
        child: Form(
          child: Column(
            children: [
              Text(' Are you sure you want to delete this task',
                style: TextStyle(
                    fontSize: 14,
                    color: CupertinoColors.black),
              ),
              SizedBox(height: 20),
              Text(widget.taskName.toString(),
                style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
              SizedBox(height: 15,),
            ],
          )
        ),
      ),
      actions: [ElevatedButton(
          onPressed: (){
        Navigator.of(context,rootNavigator: true).pop();
      },
          style: ElevatedButton.styleFrom(primary: Colors.grey),
          child: Text('Cancel')
      ),
        ElevatedButton(onPressed: (){
          deleteTask();
          Navigator.of(context,rootNavigator: true).pop();
        },
            style: ElevatedButton.styleFrom(primary: Colors.brown),
            child: Text('Save')
        )
      ],
    );
  }
  Future deleteTask() async{
    var collection = FirebaseFirestore.instance.collection('tasks');
    collection.doc(widget.taskId).delete().then
      (
          (__) => Fluttertoast.showToast(
        msg: "Task deleted successfully",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: Colors.black54,
        textColor: Colors.white,
        fontSize: 14.0),
    ).catchError(
        (error) => Fluttertoast.showToast(
            msg: "Failed: $error",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.SNACKBAR,
            backgroundColor: Colors.black54,
            textColor: Colors.white,
            fontSize: 14.0),
        );
  }

}

