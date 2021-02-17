import 'package:flutter/material.dart';
import 'package:vistima_00/utils.dart';

// ignore: non_constant_identifier_names
Widget VFloatingActionButton() {
  return FloatingActionButton(
    elevation: 1.0,
    isExtended: true,
    backgroundColor: vColorMap['icon'],
    child: Container(
      height: 45,
      width: 45,
      child: ClipOval(
        child: Container(
          // color: vColorMap['icon'],
          padding: EdgeInsets.all(7),
          child: Row(
            children: [
              SizedBox(
                width: 7.5,
              ),
              Image.asset(
                'assets/images/Start.png',
                color: Colors.white,
              )
            ],
          ),
        ),
      ),
    ),
    onPressed: () {
      //!ToCountingPage
    },
  );
}
