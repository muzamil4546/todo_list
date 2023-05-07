import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text('Categories icon page',
          style: TextStyle(
              color: Colors.brown,
              fontSize: 30),
        )
    );
  }
}
