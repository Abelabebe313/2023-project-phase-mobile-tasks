import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Circular Counter App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      if(_counter < 10){
        _counter++;

      } else{
        _counter = 0;
      }
    });
  }
  void _decrementCounter() {
    setState(() {
      if(_counter == 0){
        _counter = 10;
      }else{
        _counter--;
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black26,
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: Text(widget.title,style: TextStyle(color: Colors.black),),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                onPressed: _decrementCounter,
                icon: Icon(Icons.arrow_circle_down,size: 40,)
            ),
            SizedBox(width: 15,),

            Text(
              '$_counter',
              style: TextStyle(
                  color: Colors.lightGreen,
                  fontFamily: 'Orbitron',
                  fontSize: 100
              ),
            ),

            SizedBox(width: 15,),
            IconButton(
                onPressed: _incrementCounter,
                icon: Icon(Icons.arrow_circle_up,size: 40,)
            ),
          ],
        ),
      ),
    );
  }
}
