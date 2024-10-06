import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:medy/data/hospital_dummy.dart';
import 'package:medy/data/vo/hospital.dart';
import 'package:medy/screen/f_hospital_detail.dart';

class MapFragment extends StatefulWidget {
  const MapFragment({super.key, required});

  @override
  State<MapFragment> createState() => _MapFragmentState();
}

class _MapFragmentState extends State<MapFragment> {
  late GoogleMapController _controller;
  bool _myLocationEnabled = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _getCurrentLocation() async {
    final position = await Geolocator.getCurrentPosition();
    final cameraPosition = CameraPosition(
      target: LatLng(position.latitude, position.longitude),
      zoom: 18,
    );
    _controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
    setState(() {
      _myLocationEnabled = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Hospital> places = [
      Hospital1,
      Hospital2,
      Hospital3,
      Hospital4,
      Hospital5
    ];
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(37.532600, 127.024612), // 서울 시청 위치
              zoom: 18,
            ),
            myLocationEnabled: _myLocationEnabled,
            myLocationButtonEnabled: false,
            markers: Set<Marker>.of(places.map((place) {
              return Marker(
                markerId: MarkerId(place.name),
                position: LatLng(place.latitude, place.longitude),
                infoWindow: InfoWindow(title: place.name),
                onTap: () { },
              );
            })),
            onMapCreated: (controller) => _controller = controller,
          ),
          Positioned(
            bottom: 16,
            right: 16,
            child: FloatingActionButton(
              onPressed: _getCurrentLocation,
              foregroundColor: Colors.black,
              backgroundColor: Colors.white,
              elevation: 8,
              // 그림자 크기
              child: Icon(Icons.my_location),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10), // 버튼 모서리 둥글기
              ),
            ),
          ),
          Positioned(
            top: 54,
            child: ElevatedButton(
              onPressed: () { },
              child: Container(
                width: MediaQuery.of(context).size.width - 21,
                height: 44,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Text(
                        '위치 검색',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right: 13.0),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(8))),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
