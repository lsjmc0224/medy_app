import 'package:flutter/material.dart';
import 'package:medy/data/hospital_dummy.dart';
import 'package:medy/data/vo/hospital.dart';
import 'package:medy/screen/f_map.dart';
import 'package:medy/screen/w_hospital_filter_row.dart';
import 'package:medy/screen/w_hospital_widget.dart';
import 'package:medy/widget/w_appbar.dart';
import 'package:medy/screen/f_hospital_detail.dart'; // HospitalDetail import

class HospitalListFragment extends StatefulWidget {
  const HospitalListFragment({super.key});

  @override
  State<HospitalListFragment> createState() => _HospitalListFragmentState();
}

class _HospitalListFragmentState extends State<HospitalListFragment> {
  // Hospital 더미 데이터 리스트
  final List<Hospital> hospitalList = [
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

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // 병원 리스트와 필터
        Container(
          color: const Color(0xff3888ff), // 페이지 배경색
          child: Column(
            children: [
              const MedyAppBar(), // 앱바 위젯
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                    BorderRadius.vertical(top: Radius.circular(24.0)), // 둥근 상단 모서리
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 필터 버튼 행
                      const FilterButtonRow(),
                      // 병원 리스트 또는 없을 때의 메시지
                      Expanded(
                        child: hospitalList.isNotEmpty
                            ? SingleChildScrollView(
                          child: Column(
                            children: [
                              ...hospitalList.map((hospital) {
                                return GestureDetector(
                                  onTap: () {
                                    // 병원 세부 페이지로 이동
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            HospitalDetail(hospital: hospital),
                                      ),
                                    );
                                  },
                                  child: HospitalWidget(hospital: hospital),
                                );
                              }).toList(),
                              const SizedBox(height: 50), // 하단 여유 공간 추가
                            ],
                          ),
                        )
                            : Center(
                          child: Text(
                            '근처에 해당 의약품이 있는 병원이 없습니다.',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey.shade600,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        // 지도 보기 버튼 (하단 중앙 고정)
        Positioned(
          bottom: 50,
          left: 0,
          right: 0,
          child: GestureDetector(
            onTap: () {
              // MapFragment로 이동
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MapFragment(),
                ),
              );
            },
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                decoration: BoxDecoration(
                  color: const Color(0xff3888ff),
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.public, // 지구 아이콘
                      color: Colors.white,
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      '지도 보기',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
