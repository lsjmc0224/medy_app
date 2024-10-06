import 'package:flutter/material.dart';
import 'package:medy/widget/w_appbar.dart';

class HospitalListFragment extends StatelessWidget {
  const HospitalListFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff3888ff), // 페이지 배경색
      child: SingleChildScrollView(
        child: Column(
          children: [
            const MedyAppBar(), // 앱바 위젯

          ],
        ),
      ),
    );
  }
}
