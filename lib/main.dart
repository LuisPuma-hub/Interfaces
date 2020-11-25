import 'package:flutter/material.dart';
import 'package:interfaces/Interfaces/Create_Recipe.dart';
import 'package:interfaces/opciones.dart';


void main() => runApp(MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.cyan,
        accentColor: Colors.white,
      ),
      initialRoute: '/home',
      routes: {
        '/home': (context) => opciones(),
      }
    )
  )
;