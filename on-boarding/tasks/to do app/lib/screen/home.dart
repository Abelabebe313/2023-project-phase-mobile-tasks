import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  Card(
                    color: Colors.red,
                    child: ListTile(
                      leading: Icon(Icons.task,color: Colors.white,),
                      title: Text('UI/UX App',style: TextStyle(color: Colors.white),),
                      subtitle: Text('Design',style: TextStyle(color: Colors.white),),
                      trailing: Text('April 20 , 2023',style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  Card(
                    color: Colors.green,
                    child: ListTile(
                      leading: Icon(Icons.task,color: Colors.white,),
                      title: Text('UI/UX App',style: TextStyle(color: Colors.white)),
                      subtitle: Text('Design',style: TextStyle(color: Colors.white)),
                      trailing: Text('April 20 , 2023',style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  Card(
                    color: Colors.blue,
                    child: ListTile(
                      leading: Icon(Icons.task,color: Colors.white,),
                      title: Text('View Candidates',style: TextStyle(color: Colors.white)),
                      trailing: Text('April 20 , 2023',style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  Card(
                    color: Colors.green,
                    child: ListTile(
                      leading: Icon(Icons.task,color: Colors.white,),
                      title: Text('Football',style: TextStyle(color: Colors.white)),
                      subtitle: Text('Dribling',style: TextStyle(color: Colors.white)),
                      trailing: Text('April 20 , 2023',style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  Card(
                    color: Colors.blue,
                    child: ListTile(
                      leading: Icon(Icons.task,color: Colors.white,),
                      title: Text('Flutter app',style: TextStyle(color: Colors.white)),
                      subtitle: Text('Design',style: TextStyle(color: Colors.white)),
                      trailing: Text('April 20 , 2023',style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  Card(
                    color: Colors.red,
                    child: ListTile(
                      leading: Icon(Icons.task,color: Colors.white,),
                      title: Text('UI/UX App',style: TextStyle(color: Colors.white),),
                      subtitle: Text('Design',style: TextStyle(color: Colors.white),),
                      trailing: Text('April 20 , 2023',style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  Card(
                    color: Colors.green,
                    child: ListTile(
                      leading: Icon(Icons.task,color: Colors.white,),
                      title: Text('UI/UX App',style: TextStyle(color: Colors.white)),
                      subtitle: Text('Design',style: TextStyle(color: Colors.white)),
                      trailing: Text('April 20 , 2023',style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  Card(
                    color: Colors.blue,
                    child: ListTile(
                      leading: Icon(Icons.task,color: Colors.white,),
                      title: Text('View Candidates',style: TextStyle(color: Colors.white)),
                      trailing: Text('April 20 , 2023',style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ],
              )
          ),
          SizedBox(height: 10,),
          Container(
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
          SizedBox(height: 20,)
        ],
      ),
    );
  }
}
