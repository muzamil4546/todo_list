import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class _AddTaskAlertDialog extends StatefulWidget {
  const _AddTaskAlertDialog({Key? key}) : super(key: key);

  @override
  State<_AddTaskAlertDialog> createState() => _AddTaskAlertDialogState();
}

class _AddTaskAlertDialogState extends State<_AddTaskAlertDialog> {
  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return AlertDialog(
      scrollable: true,
      title: Text('New Task'),
      alignment: Alignment.center,
    );
  }
}
