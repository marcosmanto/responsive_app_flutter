import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_app_flutter/model/places_data.dart';
import 'package:responsive_app_flutter/pages/home_page.dart';

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

  Widget smallWidget(Color color) {
    return Consumer(builder: (context, ref, child) {
      return ListView(
        children: [
          Image.asset(
            ref.watch(selectedPlaceProvider).image,
            height: 320,
            fit: BoxFit.cover,
          ),
          titleSection(),
          buttonSection(color),
          textSection()
        ],
      );
    });
  }

  Widget largeWidget(Color color) {
    return SingleChildScrollView(
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 6,
        margin: const EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                children: [
                  Consumer(
                    builder: (context, ref, child) => Image.asset(
                      ref.watch(selectedPlaceProvider).image,
                      fit: BoxFit.cover,
                    ),
                  ),
                  titleSection(),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 24),
                    child: buttonSection(color),
                  ),
                  textSection(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget titleSection() {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Row(
        children: [
          Expanded(
            child: Consumer(builder: (context, ref, child) {
              final place = ref.watch(selectedPlaceProvider);
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(
                      place.title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    place.subtitle,
                    style: TextStyle(color: Colors.grey[500]),
                  )
                ],
              );
            }),
          ),
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 4.0),
            child: Text('41'),
          )
        ],
      ),
    );
  }

  Widget buttonSection(Color color) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buttonColumn(color, Icons.call, 'CALL'),
        buttonColumn(color, Icons.near_me, 'ROUTE'),
        buttonColumn(color, Icons.share, 'SHARE'),
      ],
    );
  }

  buttonColumn(Color color, IconData icon, String label) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: color,
            ),
            Container(
              margin: const EdgeInsets.only(top: 8),
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  color: color,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget textSection() {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Text(Places.getPlaceDescription()),
    );
  }
}
