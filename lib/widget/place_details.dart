import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_app_flutter/model/place.dart';
import 'package:responsive_app_flutter/pages/home_page.dart';

class PlaceDetails extends ConsumerWidget {
  const PlaceDetails({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Place place = ref.watch(selectedPlaceProvider);
    return Placeholder(
      child: Center(child: Text(place.title)),
    );
  }
}
