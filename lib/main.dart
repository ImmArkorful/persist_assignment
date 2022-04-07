import 'package:flutter/material.dart';
import 'package:plant/User.dart';
import 'package:plant/database.dart';
import 'package:plant/dbOperations.dart';
import 'package:plant/home.dart';
import 'package:plant/login.dart';
import 'package:plant/my_scaffold.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final db = await database().initalizeDB();

  var users = await DBOperations(db).retrieveUsers();
  if (users.isNotEmpty) {
    return runApp(
      MaterialApp(
        home: HomeView(),
      ),
    );
  }
  runApp(
    const MaterialApp(
      home: LoginPage(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.blueGrey[700] and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: const MyScaffold());
  }
}
