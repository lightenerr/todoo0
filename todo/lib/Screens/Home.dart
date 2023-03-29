import 'dart:core';
import 'Completed.dart';
import 'UI.dart';
import 'package:flutter/material.dart';
import '../Utility/Class.dart';


class Tabs extends StatelessWidget {
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Todo-List'),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.data_array_outlined),
                text: 'My List',
              ),
              Tab(
                icon: Icon(Icons.list),
                text: 'List',
              ),
              Tab(
                icon: Icon(Icons.list),
                text: 'List',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            UI(),
            Complete(),
            Show_Tasks(),
          ],
        ),
      ),
    );
  }
}
