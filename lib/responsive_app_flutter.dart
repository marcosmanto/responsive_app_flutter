import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_app_flutter/pages/home_page.dart';

void main() {
  runApp(const ProviderScope(child: PlacesApp()));
}

class PlacesApp extends StatelessWidget {
  const PlacesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Places App',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: const HomePage(),
    );
  }
}
