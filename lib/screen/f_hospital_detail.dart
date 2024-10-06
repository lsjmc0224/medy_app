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

  // Medicine dummy data
  final List<Map<String, String>> medicineList = [
    {"name": "약품1", "status": "●"},
    {"name": "약품2", "status": "△"},
    {"name": "약품3", "status": "●"},
    {"name": "약품4", "status": "△"},
    {"name": "약품5", "status": "●"},
    {"name": "약품6", "status": "●"},
    {"name": "약품7", "status": "●"},
    {"name": "약품8", "status": "●"},
    {"name": "약품9", "status": "●"},
    {"name": "약품10", "status": ""},
    {"name": "약품11", "status": "●"},
    {"name": "약품12", "status": "●"},
    {"name": "약품13", "status": "●"},
    {"name": "약품14", "status": "●"},
    {"name": "약품15", "status": "●"},
  ];

  @override
  Widget build(BuildContext context) {
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
