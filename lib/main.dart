import 'package:flutter/material.dart';
import 'package:quotenote/pages/home_page.dart';
import 'package:quotenote/utilities/theme.dart';
import 'package:quotenote/utilities/proje_settigns.dart';

void main() {
  runApp( MainApp());
}

// ignore: must_be_immutable
class MainApp extends StatelessWidget {
   MainApp({super.key});
  ProjeSettigns settigns=ProjeSettigns();

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:appMainTheme ,
      title: settigns.appBarTitle,
      home:HomePage()
    );
  }
}
