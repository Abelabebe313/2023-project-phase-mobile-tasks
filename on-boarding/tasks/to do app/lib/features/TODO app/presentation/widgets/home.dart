import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:to_do_app/features/TODO%20app/presentation/widgets/TaskDetail.dart';
import 'package:to_do_app/features/TODO%20app/presentation/widgets/createTask.dart';

class Home extends StatefulWidget {

  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Map<String, dynamic>> tasks = [
    {
      'taskId': 1,
      'taskName': 'flutter',
      'dueDate': '9-8-2023',
      'description': 'tutorial for flutter',
      'isCompleted': false,
    }
  ];

  void addTask(Map<String, dynamic> newTask) {
    setState(() {
      tasks.add(newTask);
    });
  }
  void deleteTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }
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
        children: [
          Center(
            child: Image.asset('assets/images/stickman - todo-list.png'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Tasks list',
                style: TextStyle(
                  fontSize: 19,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                )
            ),
          ),
          Expanded(
            flex: 2,
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                final task = tasks[index];
                return Card(
                  color: task['isCompleted'] ? Colors.green : Colors.grey.shade100,
                  child: ListTile(
                    onTap: (){
                      _onTaskTapped(task, index);
                    },
                    leading: Icon(Icons.task, color: Colors.blue),
                    title: Text(task['taskName'] ?? ''),
                    subtitle: Text(task['dueDate'] ?? ''),
                    // trailing: Text(task['dueDate'] ?? '', style: TextStyle(color: Colors.white)),
                    trailing: Checkbox(
                      value: task['isCompleted'],
                      onChanged: (bool? value) {
                        setState(() {
                          task['isCompleted'] = value ?? false;
                        });
                      },
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 10,),

          InkWell(
            onTap: (){
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => CreateTask(addTask: addTask),
                ),
              );
            },
            child: Container(
              width: 256,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: HexColor('#EE6F57'),),
              child: Center(
                  child: Text(
                      "Create task",
                      style: TextStyle(
                        fontSize: 19,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      )
                  )
              ),
            ),
          ),
          SizedBox(height: 20,)
        ],
      ),
    );
  }


  void _onTaskTapped(Map<String, dynamic> task, int index) async {
    Map<String, String>? updatedTask = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TaskDetail(task: task),
      ),
    );

    if (updatedTask != null) {
      _updateTask(updatedTask, index);
    }
  }

  void _updateTask(Map<String, String> updatedTask, int index) {
    setState(() {
      tasks[index] = updatedTask;
    });
  }

}