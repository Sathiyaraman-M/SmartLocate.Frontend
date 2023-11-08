import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> with OSMMixinObserver {
  late MapController mapController;

  @override
  void initState() {
    super.initState();
    mapController = MapController(
      // initMapWithUserPosition: const UserTrackingOption(),
      initPosition: GeoPoint(
        latitude: 87.4358055,
        longitude: 88.4737324,
      ),
    );
    mapController.addObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Open Street Map'),
      ),
      body: OSMFlutter(
        controller: mapController,
        osmOption: OSMOption(
          enableRotationByGesture: true,
          userTrackingOption: const UserTrackingOption(
              enableTracking: true, unFollowUser: false),
          zoomOption: const ZoomOption(
            initZoom: 19,
            minZoomLevel: 3,
            maxZoomLevel: 19,
            stepZoom: 1.0,
          ),
          markerOption: MarkerOption(
            defaultMarker: const MarkerIcon(
              icon: Icon(
                Icons.home,
                color: Colors.blue,
                size: 32,
              ),
            ),
            advancedPickerMarker: const MarkerIcon(
              icon: Icon(
                Icons.location_searching,
                color: Colors.green,
                size: 56,
              ),
            ),
          ),
          userLocationMarker: UserLocationMaker(
            personMarker: MarkerIcon(
              iconWidget: SizedBox(
                width: 32,
                height: 64,
                child: Image.asset(
                  "asset/directionIcon.png",
                  scale: .3,
                ),
              ),
            ),
            directionArrowMarker: MarkerIcon(
              iconWidget: SizedBox(
                width: 32,
                height: 64,
                child: Image.asset(
                  "asset/directionIcon.png",
                  scale: .3,
                ),
              ),
            ),
          ),
          roadConfiguration: const RoadOption(
            roadColor: Colors.blueAccent,
          ),
          showContributorBadgeForOSM: true,
        ),
        // mapIsLoading: const Center(
        //   child: CircularProgressIndicator(),
        // ),
        // mapIsLoading: const Center(
        //   child: Column(
        //     mainAxisSize: MainAxisSize.min,
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     crossAxisAlignment: CrossAxisAlignment.center,
        //     children: [
        //       CircularProgressIndicator(),
        //       SizedBox(height: 10),
        //       Text("Map is Loading.."),
        //     ],
        //   ),
        // )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Getting current location...'),
            ),
          );
          await mapController.currentLocation();
        },
        child: const Icon(Icons.my_location),
      ),
    );
  }

  @override
  Future<void> mapIsReady(bool isReady) {
    return Future.value();
  }
}
