import 'package:flutter/material.dart';

class mainPage extends StatefulWidget {
  @override
  class MyApp extends StatefulWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(top: 60.0, left: 45.0),
                  child: Text(
                    "Hello, Friend!",
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(top: 5.0, left: 45.0),
                  child: Text(
                    "Let's start accounting for expenses",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(85, 85, 85, 85),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Center(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

}