import 'package:flutter/material.dart';

class MedicineInfoSection extends StatelessWidget {
  final List<Map<String, String>> medicineList;

  const MedicineInfoSection({super.key, required this.medicineList});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 주요 의약품 정보 텍스트
          const Text(
            "주요 의약품 정보",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),

          // 왼쪽 정렬 텍스트 두 줄
          const Text(
            "● : 응고인자 상시 비치\n△ : 입원 치료 등 필요 시 응고인자 공급",
            style: TextStyle(
              fontSize: 14,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 16),

          // 약품명과 상태를 나타내는 테이블 (중앙 정렬)
          Table(
            border: TableBorder.all(color: Colors.grey),
            columnWidths: const {
              0: FlexColumnWidth(1), // 약품명 열의 비율
              1: FlexColumnWidth(1), // 상태 열의 비율
            },
            children: [
              // 표 헤더
              TableRow(
                children: [
                  Container(
                    color: Colors.black.withOpacity(0.06), // 헤더 배경색 설정
                    padding: const EdgeInsets.all(8.0),
                    child: const Text(
                      "약품명",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center, // 중앙 정렬
                    ),
                  ),
                  Container(
                    color: Colors.black.withOpacity(0.06), // 헤더 배경색 설정
                    padding: const EdgeInsets.all(8.0),
                    child: const Text(
                      "상태",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center, // 중앙 정렬
                    ),
                  ),
                ],
              ),
              // 약품 데이터를 표에 추가
              ...medicineList.map((medicine) {
                return TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        medicine["name"]!,
                        style: const TextStyle(fontSize: 12),
                        textAlign: TextAlign.center, // 중앙 정렬
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        medicine["status"]!,
                        style: const TextStyle(fontSize: 12),
                        textAlign: TextAlign.center, // 중앙 정렬
                      ),
                    ),
                  ],
                );
              }).toList(),
            ],
          ),
        ],
      ),
    );
  }
}
