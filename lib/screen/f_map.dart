import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:medy/data/hospital_dummy.dart';
import 'package:medy/data/vo/hospital.dart';
import 'package:medy/screen/f_hospital_detail.dart';

class MapFragment extends StatefulWidget {
  const MapFragment({super.key});

  @override
  State<MapFragment> createState() => _MapFragmentState();
}

class _MapFragmentState extends State<MapFragment> {
  late GoogleMapController _controller;
  bool _myLocationEnabled = false;
  CameraPosition _initialCameraPosition = CameraPosition(
    target: LatLng(37.532600, 127.024612), // 서울 시청 위치
    zoom: 18,
  );

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _getCurrentLocation() async {
    try {
      final position = await Geolocator.getCurrentPosition();
      final cameraPosition = CameraPosition(
        target: LatLng(position.latitude, position.longitude),
        zoom: 18,
      );
      setState(() {
        _initialCameraPosition = cameraPosition;
        _myLocationEnabled = true;
      });
      if (_controller != null) {
        _controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
      }
    } catch (e) {
      // 위치를 가져오지 못했을 경우 기본 설정 유지
      print("Error fetching location: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Hospital> places = [
      Hospital1,
      Hospital2,
      Hospital3,
      Hospital4,
      Hospital5,
      Hospital6,
      Hospital7,
      Hospital8,
      Hospital9,
      Hospital10,
      Hospital11,
      Hospital12,
      Hospital13,
      Hospital14,
      Hospital15,
      Hospital16,
      Hospital17,
    ];
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: _initialCameraPosition,
            myLocationEnabled: _myLocationEnabled,
            myLocationButtonEnabled: false,
            markers: Set<Marker>.of(places.map((place) {
              return Marker(
                markerId: MarkerId(place.name),
                position: LatLng(place.latitude, place.longitude),
                infoWindow: InfoWindow(title: place.name),
                onTap: () {
                  // 병원 세부 페이지로 이동
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HospitalDetail(hospital: place),
                    ),
                  );
                },
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
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10), // 버튼 모서리 둥글기
              ),
              child: const Icon(Icons.my_location),
            ),
          ),
          Positioned(
            top: 54,
            left: 10,
            right: 10,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Container(
                width: double.infinity,
                height: 44,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: const Text(
                        '위치 검색',
                        style: TextStyle(
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
              ),
            ),
          ),
        ],
      ),
    );
  }
}
