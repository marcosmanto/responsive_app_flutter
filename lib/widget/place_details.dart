import 'package:flutter/material.dart';

class PlaceDetails extends StatelessWidget {
  const PlaceDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).primaryColor;

    return LayoutBuilder(
      builder: (context, constraints) {
        print('Contraints maxWidth: ${constraints.maxWidth}');
        if (constraints.maxWidth >= 600.0) {
          return largeWidget(color);
        } else {
          return smallWidget(color);
        }
      },
    );
  }
}

Widget largeWidget(Color color) {
  return Center(
    child: Text('Large Widget'),
  );
}

Widget smallWidget(Color color) {
  return Center(
    child: Text('Small Widget'),
  );
}
