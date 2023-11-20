import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_app_flutter/model/places_data.dart';

final selectedPlaceProvider = StateProvider((_) => Places.getPlaces()[0]);

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedPlace = ref.watch(selectedPlaceProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedPlace.title),
      ),
      body: ListView(
        children: [
          Image.asset(
            selectedPlace.image,
            height: 320,
            fit: BoxFit.cover,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => ref.read(selectedPlaceProvider.notifier).state =
            Places.getPlaces()[Random().nextInt(Places.getPlaces().length)],
        child: Icon(Icons.sports_martial_arts_sharp),
      ),
    );
  }
}
