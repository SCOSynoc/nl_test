import 'package:flutter/material.dart';

AppBar buildAppBar({required bool leading}) {
  return AppBar(
    automaticallyImplyLeading: leading,
    backgroundColor: Colors.white,
    elevation: 0,
    iconTheme: const IconThemeData(color: Colors.black),
    title: const Text(
      'Dashboard',
      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
    ),
    actions: const [
      CircleAvatar(
        backgroundColor: Colors.blue,
        child: Icon(Icons.person, color: Colors.white),
      ),
      SizedBox(width: 20),
    ],
  );
}