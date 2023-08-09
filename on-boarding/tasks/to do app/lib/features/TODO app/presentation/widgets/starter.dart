import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:to_do_app/features/TODO%20app/presentation/widgets/home.dart';

class Starter extends StatefulWidget {
  const Starter({Key? key}) : super(key: key);

  @override
  State<Starter> createState() => _StarterState();
}

class _StarterState extends State<Starter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#EE6F57'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 30,),
            Container(
              child: Image.asset('assets/images/stick-man.png'),
            ),
            SizedBox(height: 160,),
            InkWell(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context){
                      return Home();
                    }
                ));
              },
              child: Container(
                  width: 256,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color(0xff0c8ce9),),
                  child: Center(
                      child: Text(
                          "Get Started",
                          style: TextStyle(
                            fontSize: 19,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          )
                      )
                      ),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
