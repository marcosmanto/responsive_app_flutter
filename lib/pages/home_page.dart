import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
        heightFactor: .95,
        alignment: Alignment.topCenter,
        child: Container(
          color: Colors.pink,
        ));
  }
}
