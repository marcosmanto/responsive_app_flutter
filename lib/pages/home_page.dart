import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_app_flutter/model/places_data.dart';
import 'package:responsive_app_flutter/responsive_util.dart';

final selectedPlaceProvider = StateProvider((_) => Places.getPlaces()[0]);
final menuProvider = Provider((_) => Places.getStatesOfSouthIndia());

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final selectedPlace = ref.watch(selectedPlaceProvider);

    switch (getScreenSize(MediaQuery.of(context).size.width)) {
      case ScreenSize.small:
        return homePageSmall();
      case ScreenSize.medium:
        return homePageMedium();
      case ScreenSize.large:
        return homePageLarge();
    }
  }
}

Widget homePageSmall() {
  return Scaffold(
    appBar: appBar(),
    drawer: Drawer(
      child: drawerBody(),
    ),
    body: Placeholder(),
  );
}

Widget homePageMedium() {
  return Scaffold(
    appBar: appBar(),
    body: Row(
      children: [
        Expanded(
          flex: 2,
          child: drawerBody(),
        ),
        Expanded(flex: 5, child: Placeholder())
      ],
    ),
  );
}

Widget homePageLarge() {
  return Scaffold(
    appBar: appBar(),
    body: Row(
      children: [
        Expanded(flex: 1, child: drawerBody()),
        Expanded(
          flex: 3,
          child: Container(
            color: Colors.grey[200],
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Placeholder(),
                  ),
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: Consumer(
                        builder: (context, ref, child) => Image.asset(
                          ref.read(selectedPlaceProvider).image,
                          //height: 320,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    ),
  );
}

PreferredSizeWidget appBar() {
  return AppBar(title: Text('Flutter Responsive App'));
}

Widget drawerBody() {
  return Consumer(
    builder: (context, ref, child) {
      final menuItems = ref.read(menuProvider);

      return ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: menuItems.length + 1, // +1 for the header
        itemBuilder: (context, index) {
          if (index == 0) {
            return DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: ExactAssetImage(
                      'assets/images/india_chettinad_silk_maker.png'),
                ),
              ),
              child: Container(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'South India',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
            );
          } else {
            return ListTile(
              leading: Icon(Icons.location_city),
              title: Text(menuItems[index - 1]),
              selected: index == 4 ? true : false,
            );
          }
        },
      );
    },
  );
}
