import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class TaskDetail extends StatefulWidget {
  const TaskDetail({Key? key}) : super(key: key);

  @override
  State<TaskDetail> createState() => _TaskDetailState();
}

class _TaskDetailState extends State<TaskDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: HexColor('#EE6F57'),
        elevation: 0,
        title: Center(
          child: Text('Todo List',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.menu,
              color: Colors.black,
              size: 32,
            ),
            onPressed:(){},
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Image.asset('assets/images/shopping-list 1.png'),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20,0,0,0),
            child: Text('Tasks list',
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                )
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                ),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20,0,0,0),
            child: Text('Description',
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                )
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.grey[200],
              ),
              child: TextField(
                maxLines: 3,
                decoration: InputDecoration(
                  border: InputBorder.none,

                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20,0,0,0),
            child: Text('Deadline',
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                )
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.grey[200],
              ),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
