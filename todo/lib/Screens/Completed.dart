import 'package:flutter/material.dart';

class Complete extends StatelessWidget {
  const Complete({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[200],
        body: Center(
      child: Text("Completed Tasks")

        ),    );
  }
}
