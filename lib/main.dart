import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:just_app/screens/tab_manager.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('UserDetails');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: TabsManager());
  }
}
