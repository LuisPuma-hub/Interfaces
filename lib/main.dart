import 'package:flutter/material.dart';

import 'package:interfaces/Interfaces/LoginPage.dart';
import 'package:interfaces/my_flutter_app_icons.dart';

void main() => runApp(MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.cyan,
        accentColor: Colors.white,
      ),
      initialRoute: '/home',
      routes: {
        '/home': (context) => Login(),
      }
    )
  )
;