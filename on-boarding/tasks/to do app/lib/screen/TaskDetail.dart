import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class TaskDetail extends StatefulWidget {
  final Map<String, String> task;
  // final Function(Map<String, String> updatedTask) updateTask;

  const TaskDetail({Key? key,required this.task, }) : super(key: key);

  @override
  State<TaskDetail> createState() => _TaskDetailState();
}

class _TaskDetailState extends State<TaskDetail> {
  TextEditingController taskNameController = TextEditingController();
  TextEditingController taskDateController = TextEditingController();
  TextEditingController taskDescriptionController = TextEditingController();
  DateTime? selectedDate;
  @override
  void initState() {
    super.initState();
    taskNameController.text = widget.task['taskName'] ?? '';
    taskDateController.text = widget.task['dueDate'] ?? '';
    taskDescriptionController.text = widget.task['description'] ?? '';
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: HexColor('#EE6F57'),
        elevation: 0,
        title: Center(
          child: Text('Task Detail',
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
      body: SingleChildScrollView(
        child: Column(
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
                    controller: taskNameController,
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
                  controller: taskDescriptionController,
                  readOnly: true,
                  onTap: () {
                    _selectDate(context);
                  },
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
                  controller: taskDateController,
                  readOnly: true,
                  onTap: () {
                    _selectDate(context);
                  },
                ),
              ),
            ),

            SizedBox(height: 24),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  _saveChanges();
                },
                child: Text('Save Changes'),
              ),
            ),
          ],
        ),
      ),
    );
  }
  void _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  void _saveChanges() {
    String updatedTaskName = taskNameController.text;
    String updatedDueDate = taskDateController.text;
    String updatedDescription = taskDescriptionController.text;

    Map<String, String> updatedTask = {
      'taskName': updatedTaskName,
      'dueDate': updatedDueDate,
      'description': updatedDescription,
    };

    // widget.updateTask(updatedTask);
    Navigator.pop(context, updatedTask);
  }
}
