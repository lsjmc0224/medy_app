import 'package:medy/data/vo/medicine.dart';

class Hospital {
  final int id;
  final String name;
  final String address;
  final String tel;
  final double latitude;
  final double longitude;
  final String imagePath;
  final Map<Medicine, int> availableMedicines; // 각 병원에서 사용 가능한 의약품과 상태

  Hospital({
    required this.id,
    required this.name,
    required this.address,
    required this.tel,
    required this.latitude,
    required this.longitude,
    required this.imagePath,
    required this.availableMedicines, // 새로운 속성 추가
  });
}
