import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:medy/data/vo/hospital.dart';
import 'dart:math';

class HospitalWidget extends StatefulWidget {
  final Hospital hospital;

  const HospitalWidget({super.key, required this.hospital});

  @override
  State<HospitalWidget> createState() => _HospitalWidgetState();
}

class _HospitalWidgetState extends State<HospitalWidget> {
  double? distanceInKm;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  // 현재 위치 가져오기
  Future<void> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // 위치 서비스가 활성화되어 있는지 확인
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // 위치 서비스가 활성화되지 않은 경우 예외 처리
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // 권한이 거부된 경우 예외 처리
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // 영구적으로 권한이 거부된 경우 예외 처리
      return;
    }

    // 현재 위치 가져오기
    Position position = await Geolocator.getCurrentPosition();
    double distance = _calculateDistance(
      position.latitude,
      position.longitude,
      widget.hospital.latitude,
      widget.hospital.longitude,
    );

    setState(() {
      distanceInKm = distance;
    });
  }

  // 두 지점 간의 직선 거리 계산 (Haversine 공식을 사용)
  double _calculateDistance(
      double startLatitude,
      double startLongitude,
      double endLatitude,
      double endLongitude,
      ) {
    const int earthRadius = 6371; // 지구 반지름 (킬로미터 단위)

    double dLat = _degreeToRadian(endLatitude - startLatitude);
    double dLon = _degreeToRadian(endLongitude - startLongitude);

    double a = sin(dLat / 2) * sin(dLat / 2) +
        cos(_degreeToRadian(startLatitude)) *
            cos(_degreeToRadian(endLatitude)) *
            sin(dLon / 2) *
            sin(dLon / 2);
    double c = 2 * asin(sqrt(a));

    return earthRadius * c;
  }

  double _degreeToRadian(double degree) {
    return degree * pi / 180;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 병원 사진 (원형 이미지, 더미 데이터를 사용)
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(widget.hospital.imagePath),
          ),
          const SizedBox(width: 16),
          // 병원 정보
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.hospital.name,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  distanceInKm != null
                      ? '현재 위치에서 ${distanceInKm!.toStringAsFixed(2)} km'
                      : '거리를 계산 중입니다...',
                  style: const TextStyle(fontSize: 12, color: Colors.black),
                ),
                Text(
                  widget.hospital.tel,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
                const Text(
                  '진료시간: hh:mm ~ hh:mm', // 진료시간 더미 텍스트
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
