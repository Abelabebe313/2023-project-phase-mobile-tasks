import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:to_do_app/screen/home.dart';

class CreateTask extends StatefulWidget {
  final Function(Map<String, String> newTask) addTask;
  const CreateTask({Key? key,required this.addTask}) : super(key: key);

  @override
  State<CreateTask> createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTask> {
  final TextEditingController task_name_controller = TextEditingController();
  final TextEditingController task_description_controller = TextEditingController();
  final TextEditingController task_date_controller = TextEditingController();

  DateTime? selectedDate;
  @override
  void dispose() {
    // TODO: implement dispose
    task_name_controller.dispose();
    task_description_controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: HexColor('#EE6F57'),
        elevation: 0,
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
              child: Text('Create new task',
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20,0,0,0),
              child: Text('main task name',
                  style: TextStyle(
                    fontSize: 22,
                    color: HexColor('#EE6F57'),
                    fontWeight: FontWeight.bold,
                  )
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(15)
                ),
                child: TextField(
                  controller: task_name_controller,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(16),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(20,0,0,0),
              child: Text('Due date',
                  style: TextStyle(
                    fontSize: 22,
                    color: HexColor('#EE6F57'),
                    fontWeight: FontWeight.bold,
                  )
              ),
            ),
            // Container(
            //   padding: EdgeInsets.all(20),
            //   child: Container(
            //     decoration: BoxDecoration(
            //         color: Colors.grey[200],
            //         borderRadius: BorderRadius.circular(15)
            //     ),
            //     child: TextField(
            //       decoration: InputDecoration(
            //         contentPadding: EdgeInsets.all(16),
            //         border: InputBorder.none,
            //       ),
            //     ),
            //   ),
            // ),
            Container(
              padding: EdgeInsets.all(20),
              child: Stack(
                alignment: Alignment.centerRight,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: TextFormField(
                      controller: task_date_controller,
                      enabled: false,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(16),
                        border: InputBorder.none,
                        hintText: selectedDate == null
                            ? 'Select due date'
                            : selectedDate.toString(),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.calendar_today,
                      color: HexColor('#EE6F57'),
                    ),
                    onPressed: () {
                      _selectDate(context);
                    },
                  ),
                ],
              ),
            ),


            Padding(
              padding: const EdgeInsets.fromLTRB(20,0,0,0),
              child: Text('Description',
                  style: TextStyle(
                    fontSize: 22,
                    color: HexColor('#EE6F57'),
                    fontWeight: FontWeight.bold,
                  )
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(15)
                ),
                child: TextField(
                  controller: task_description_controller,
                  maxLines: 3,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(16),
                    border: InputBorder.none,

                  ),
                ),
              ),
            ),

            InkWell(
              onTap: (){
                _addTask();
              },
              child: Center(
                child: Container(
                  width: 200,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: HexColor('#EE6F57'),
                  ),
                  child: Center(
                      child: Text(
                          "Add Task",
                          style: TextStyle(
                            fontSize: 19,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          )
                      )
                  ),
                ),
              ),
            ),
          ],
        ),
      )

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

  void _addTask() {
    String taskName = task_name_controller.text.trim();
    String dueDate = selectedDate != null
        ? '${selectedDate?.day}-${selectedDate?.month}-${selectedDate?.year}'
        : '';
    String description = task_description_controller.text;

    if (taskName.isEmpty) {
      // Show a SnackBar indicating that the task name is required
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Task name cannot be empty.'),
          duration: Duration(seconds: 2), // Adjust the duration as needed
        ),
      );
      return;
    }

    Map<String, String> newTask = {
      'taskName': taskName,
      'dueDate': dueDate,
      'description': description,
    };
    widget.addTask(newTask);
  }



}


