import 'package:flutter/material.dart';
import 'package:medy/data/vo/hospital.dart';
import 'package:medy/screen/w_hospital_widget.dart';
import 'package:medy/screen/w_medicine_info.dart';

class HospitalDetail extends StatefulWidget {
  final Hospital hospital;

  const HospitalDetail({super.key, required this.hospital});

  @override
  State<HospitalDetail> createState() => _HospitalDetailState();
}

class _HospitalDetailState extends State<HospitalDetail> {
  bool isBookmarked = false;

  // Method to convert hospital's availableMedicines data to a List<Map<String, String>>
  List<Map<String, String>> getMedicineList() {
    return widget.hospital.availableMedicines.entries.map((entry) {
      String statusSymbol;

      switch (entry.value) {
        case 0:
          statusSymbol = ""; // 사용 불가
          break;
        case 1:
          statusSymbol = "△"; // 조건부 사용 가능
          break;
        case 2:
          statusSymbol = "●"; // 상시 사용 가능
          break;
        default:
          statusSymbol = ""; // 기본적으로 빈 문자열
      }

      return {
        "name": entry.key.name,
        "status": statusSymbol,
      };
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    // Get the medicine list based on the current hospital data
    final List<Map<String, String>> medicineList = getMedicineList();

    return Scaffold(
      appBar: AppBar(
        title: const Text(''), // 타이틀은 보이지 않게 설정
        actions: [
          IconButton(
            icon: Icon(
              isBookmarked ? Icons.bookmark : Icons.bookmark_border,
              color: Colors.black,
            ),
            onPressed: () {
              setState(() {
                isBookmarked = !isBookmarked; // 북마크 상태 토글
              });
            },
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0, // 앱바 그림자 제거
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 현재 병원의 HospitalWidget
            HospitalWidget(hospital: widget.hospital),

            // 회색 구분선 컨테이너
            Container(
              color: const Color(0xffcccccc),
              height: 8,
            ),

            // 주요 의약품 정보 섹션
            MedicineInfoSection(medicineList: medicineList),
            const SizedBox(height: 50), // 하단 여유 공간 추가
          ],
        ),
      ),
    );
  }
}
