import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Container(
        padding: EdgeInsets.all(40),
        margin: EdgeInsets.all(50),
        decoration: BoxDecoration(color: Colors.blue[300]),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Colors.blue[600],
          ),
          child: Center(
            child: Text(
              "CADT STUDENTS",
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                decoration: TextDecoration.none,
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
