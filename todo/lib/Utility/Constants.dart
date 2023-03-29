import 'package:flutter/material.dart';

final description_c = TextEditingController();
final title_c = TextEditingController();
var date_c = TextEditingController();
var priority_c = TextEditingController();
var category_c = TextEditingController();

const List<String> Priority = <String>['Low', 'Moderate', 'High', 'Urgent!'];
const List<String> Tasks_Category = <String>[
  'Work',
  'Study',
  'Groceries',
  'Movie'
];


class TaskL {
  int id;
  String category;
  String title;
  String description;
  String priority;
  String date;
  bool isComplete = false;
  bool toBeDeleted = false;

  TaskL({
    required this.id,
    required this.category,
    required this.title,
    required this.description,
    required this.priority,
    required this.date,
  });
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'Category': category,
      'Title': title,
      'Description': description,
      'Priority': priority,
      'Date': date,
    };
  }

  @override
  String toString() {
    return 'Tasks{id: $id, Category: $category, Title: $title, Description: $description,Priority: $priority, Date: $date}';
  }
}



// class Card extends StatefulWidget {
//   String? category = "";
//   String? description = "";
//   String? title;
//   String? date;
//   int? priority;
//   bool isComplete = false;
//   bool toBeDeleted = false;
//
//   Card({this.title, this.date, this.priority, this.description, this.category});
//
//   // @override
// Widget build(BuildContext context) {
//   return Column(
//     children: [
//       TextFormField(
//         controller: title_c,
//         decoration: InputDecoration(
//           label: Text("Task Tittle"),
//           icon: Icon(Icons.task),
//         ),
//       ),
//       TextFormField(
//         controller: description_c,
//         decoration: InputDecoration(
//           label: Text("Description"),
//           icon: Icon(Icons.description_outlined),
//         ),
//       ),
//       TextFormField(
//         controller: priority_c,
//         decoration: InputDecoration(
//           label: Text("Priority"),
//           icon: Icon(Icons.priority_high),
//         ),
//       ),
//       TextFormField(
//         controller: date_c ,
//         decoration: InputDecoration(
//           label: Text("Date"),
//           icon: Icon(Icons.calendar_month_outlined),
//         ),  onTap: () async {DateTime? pickedDate = await showDatePicker(
//   context: context,
//   initialDate: DateTime.now(),
//   firstDate: DateTime(2022),
//   lastDate: DateTime(2035));
//
//   String formattedDate =    DateFormat('dd-MM-yyyy').format(pickedDate!);
//   setState(() {
//   date_c.text =
//   formattedDate; //set output date to TextField value.
//   });}),
//       //   Task.Category
//       //     Task.title
//       //     Task.time
//       //     Task.priority
//       //     icon color
//     ],
//   );
// }
// class TodoI {
//   String category = "";
//   String description = "";
//   String title;
//   String date;
//   int priority;
//   bool isComplete = false;
//   bool toBeDeleted = false;
//
//   TodoI(
//       {required this.title,
//       required this.date,
//       required this.priority,
//       required this.description,
//       required this.category});
// }
