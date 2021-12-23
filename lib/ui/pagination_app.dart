import 'package:flutter/material.dart';
import 'package:flutter_pagination/ui/home_page/home_page.dart';

class PaginationApp extends StatelessWidget {
  const PaginationApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
