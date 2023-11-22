import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_app_flutter/pages/home_page.dart';
import 'package:responsive_app_flutter/widget/place_details.dart';

class PlaceDetailsPage extends ConsumerWidget {
  const PlaceDetailsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final place = ref.watch(selectedPlaceProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(place.subtitle),
        centerTitle: true,
      ),
      body: PlaceDetails(),
    );
  }
}
