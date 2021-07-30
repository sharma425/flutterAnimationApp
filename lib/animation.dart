// import 'dart:ui';

import 'package:flutter/material.dart';
var myanicon;
var animation;
int i;

class MyAnimation extends StatefulWidget {
  @override
  _MyAnimationState createState() => _MyAnimationState();
}

class _MyAnimationState extends State<MyAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController myanicon;

  @override
  void initState() {
    super.initState();
    myanicon = AnimationController(vsync: this,duration: Duration(milliseconds: 100));
    myanicon.forward();
    print(myanicon);
   
   animation = CurvedAnimation(parent: myanicon,curve: Curves.easeInCirc)
    .. addListener(() {
      setState(() {
        print(animation.value);
        i= animation.value.toInt();
        if (i == 1.0){
          myanicon.forward(from: 0.0);
        }
        
      });
      
    });
        
  }

  @override
  void dispose() {
    super.dispose();
    myanicon.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(appBar: AppBar(title: Text("Animation App"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              elevation: 10 * animation.value,
              child: Container(
                height: 150 + 100*animation.value,
                width: 150 + 100*animation.value,

                // color: Color.fromRGBO(150 + 50*i,200 + 550 *i,100 + 150*i,0.0001),
                color: Colors.amber,
                child: Center(child: 
                Text(
                  "Hello LW",
                  style: TextStyle(fontSize: 30*animation.value),
                )),
              ),
            ),

            Container(
              height: 50,
              width: 100,
              child: Card(
                child: GestureDetector(onTap: () {myanicon.forward(from : 0.0) ;},child: Center(child: Text("click here")),),
              ),
            ),
          ],
        ),
      ),
      ),
      
    );
  }
}