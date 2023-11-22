import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_app_flutter/model/place.dart';
import 'package:responsive_app_flutter/model/places_data.dart';
import 'package:responsive_app_flutter/pages/home_page.dart';
import 'package:responsive_app_flutter/responsive_util.dart';

class PlacesGallery extends StatelessWidget {
  final bool showHorizontalGridView;

  const PlacesGallery({super.key, this.showHorizontalGridView = false});

  @override
  Widget build(BuildContext context) {
    int itemCount = showHorizontalGridView ? 1 : 2;
    Axis axisDirection =
        showHorizontalGridView ? Axis.horizontal : Axis.vertical;

    return Container(
      color: Colors.grey[200],
      child: GridView.count(
        crossAxisCount: itemCount,
        scrollDirection: axisDirection,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        padding: const EdgeInsets.all(8),
        childAspectRatio: 1 / 1.2,
        children: gridItems(),
      ),
    );
  }
}

List<Widget> gridItems() {
  return Places.getPlaces().map<Widget>((place) => _GridItem(place)).toList();
}

class _GridItem extends ConsumerWidget {
  final Place place;

  const _GridItem(this.place, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
      child: InkWell(
        child: GridTile(
          footer: GridTileBar(
            backgroundColor: Colors.black45,
            title: Text(place.title),
            subtitle: Text(place.subtitle),
          ),
          child: Ink.image(
            image: AssetImage(place.image),
            fit: BoxFit.cover,
          ),
        ),
        onTap: () {
          switch (getScreenSize(MediaQuery.of(context).size.width)) {
            case ScreenSize.small:
            case ScreenSize.medium:
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Placeholder(),
                ),
              );
              break;
            case ScreenSize.large:
              ref.read(selectedPlaceProvider.notifier).state = place;
              break;
          }
        },
      ),
    );
  }
}
