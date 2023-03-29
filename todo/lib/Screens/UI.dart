import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../Utility/Constants.dart';
import 'package:flutter/widgets.dart';
import '../Utility/DB.dart';

class UI extends StatefulWidget {
  const UI({Key? key}) : super(key: key);

  @override
  State<UI> createState() => _UIState();
}

class _UIState extends State<UI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Card(),
    );
  }
}

String dropdownValue = Priority.first;
String dropdownValu = Tasks_Category.first;
var id = 1;

class Card extends StatefulWidget {
  const Card({Key? key}) : super(key: key);

  @override
  State<Card> createState() => _CardState();
}

class _CardState extends State<Card> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 50.0,
          width: 400.0,
          alignment: Alignment.centerRight,
          margin: const EdgeInsets.all(9),
          padding: const EdgeInsets.only(left: 31),
          child: DropdownButtonFormField<String>(
            hint: Text('Category'),
            value: dropdownValu,
            icon: const Icon(Icons.category),
            elevation: 16,
            // style: const TextStyle(color: Colors.deepPurple),
            onChanged: (String? value) {
              setState(() {
                dropdownValu = value!;
                category_c.text = value;
              });
            },
            isExpanded: true,
            items: Tasks_Category.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
        TextFormField(
          controller: title_c,
          decoration: InputDecoration(
            label: Text("Task Tittle"),
            icon: Icon(Icons.task),
          ),
        ),
        TextFormField(
          controller: description_c,
          decoration: InputDecoration(
            label: Text("Description"),
            icon: Icon(Icons.description_outlined),
          ),
        ),
        Container(
          height: 50.0,
          width: 400.0,
          alignment: Alignment.centerRight,
          margin: const EdgeInsets.all(9),
          padding: const EdgeInsets.only(left: 31),
          child: DropdownButtonFormField<String>(
            hint: Text('Priority'),
            value: dropdownValue,
            icon: const Icon(Icons.priority_high),
            elevation: 16,
            // style: const TextStyle(color: Colors.deepPurple),
            onChanged: (String? value) {
              setState(() {
                dropdownValue = value!;
                priority_c.text = value;
              });
            },
            isExpanded: true,
            items: Priority.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),

          // TextFormField(
          //   controller: priority_c,
          //   decoration: InputDecoration(
          //     label: Text("Priority"),
          //     icon: Icon(Icons.priority_high),
          //   ),
        ),
        TextFormField(
            controller: date_c,
            decoration: InputDecoration(
              label: Text("Date"),
              icon: Icon(Icons.calendar_month_outlined),
            ),
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2022),
                  lastDate: DateTime(2035));

              String formattedDate =
                  DateFormat('dd-MM-yyyy').format(pickedDate!);
              setState(
                () {
                  date_c.text =
                      formattedDate; //set output date to TextField value.
                },
              );
            }),
        // DataB.initdb();
        OutlinedButton.icon (
          onPressed: () async {
            DataB _dataB= DataB();
           // await _dataB.initdb();
            await _dataB.insertItem(TaskL(
                id: id++,
                category: category_c.text,
                title: title_c.text,
                description: description_c.text,
                priority: priority_c.text,
                date: date_c.text));
          },
          // print("n"),
          icon: Icon(Icons.save_alt_outlined),
          label: Text('Save'),
        )
      ],
    );
  }
}
