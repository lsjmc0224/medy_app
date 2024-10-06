import 'package:flutter/material.dart';
import 'package:medy/screen/w_filter_button.dart';


class FilterButtonRow extends StatelessWidget {
  const FilterButtonRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FilterButton(
          label: '가까운 순',
          onTap: () {
            // 가까운 순 필터링 이벤트
          },
        ),
        const SizedBox(width: 12), // 버튼 간의 간격을 12pt로 설정
        FilterButton(
          label: '지역',
          onTap: () {
            // 지역 필터링 이벤트
          },
        ),
        const SizedBox(width: 12), // 버튼 간의 간격을 12pt로 설정
        FilterButton(
          label: '의약품명',
          onTap: () {
            // 의약품명 필터링 이벤트
          },
        ),
      ],
    );
  }
}
