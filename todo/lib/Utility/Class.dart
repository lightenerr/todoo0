import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'Constants.dart';
import '../Utility/DB.dart';

// Make widget

class Show_Tasks extends StatefulWidget {
  @override
  State<Show_Tasks> createState() => _Show_TasksState();
}

String dropdownValue = Priority.first;
String dropdownValu = Tasks_Category.first;
class _Show_TasksState extends State<Show_Tasks> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField( readOnly : true,
          controller: category_c,
          decoration: InputDecoration(
            label: Text("Category"),
            icon: Icon(Icons.category_outlined),
          ),
        ),
        TextFormField( readOnly : true,
          controller: title_c,
          decoration: InputDecoration(
            label: Text("Task Tittle"),
            icon: Icon(Icons.task),
          ),
        ),
        TextFormField(readOnly : true,
          controller: description_c,
          decoration: InputDecoration(
            label: Text("Description"),
            icon: Icon(Icons.description_outlined),
          ),
        ),
        TextFormField(readOnly : true,
          controller: priority_c,
          decoration: InputDecoration(
            label: Text("Priority"),
            icon: Icon(Icons.priority_high),
          ),
        ),
        TextFormField(readOnly : true,
            controller: date_c,
            decoration: InputDecoration(
              label: Text("Date"),
              icon: Icon(Icons.calendar_month_outlined),
            ),
           ),
      ],
    );
  }
}
