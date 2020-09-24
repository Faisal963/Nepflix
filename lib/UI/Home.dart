
import 'package:flutter/material.dart';

class ScaffoldE extends StatelessWidget {

  _tapButton() {
    debugPrint("Tpped button");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NepFlix",
          style: TextStyle(color: Colors.red.withOpacity(0.6))),
        centerTitle: true,
        backgroundColor: Colors.black,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.email), onPressed: () => debugPrint("Email Tapped")),
          IconButton(icon: Icon(Icons.access_alarms_sharp), onPressed: _tapButton)
        ],

      ),
      backgroundColor: Colors.black54,
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CustomButton()
            // InkWell(
            //   child: Text("Tap me plz",
            //    style: TextStyle(fontSize: 24),),
            //
            //   onTap: () => debugPrint("Tapped..."),
            // )
          ],
        ),
      ),
      // body: Center(
      //   child: Text("Hello there!! I'm being made by some students, "
      //       "thank them for every thing u have and pray for forgiveness",
      //   style: TextStyle(color: Colors.red),),
      // ),
    );
  }
}


class CustomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final snackBar = SnackBar(content: Text("Hello again"),);
        Scaffold.of(context).showSnackBar(snackBar);


        },
      child: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.circular(8.0)
        ),
        child: Text("Button"),

      ),
    );
  }
}



class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.redAccent,
      child: Center(
          child: Text(
            "Hello Flutter 2",
            textDirection: TextDirection.ltr,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 25,
              fontStyle: FontStyle.italic,
            ),
          )),
    );

    // return Center(
    //   child: Text("Hello Flutter", textDirection: TextDirection.ltr,),);
  }
}
