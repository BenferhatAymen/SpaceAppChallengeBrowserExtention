import 'package:flutter/material.dart';
import 'package:flutterext/pages/home_page.dart';

void main() {
  runApp(DataSeeWebExtention());
}

class DataSeeWebExtention extends StatelessWidget {
  const DataSeeWebExtention({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DataSeeWebExtention',
      routes: {HomePage.id: (context) => HomePage()},
      initialRoute: HomePage.id,
    );
  }
}
