import 'package:flutter/material.dart';
import 'package:medy/intro/birth_date_page.dart';
import 'package:medy/intro/diagnosis_age_page.dart';
import 'package:medy/intro/gender_select.dart';
import 'package:medy/intro/w_intro_next_button.dart';
import 'package:medy/intro/residence_area.dart';
import 'package:medy/intro/start.dart';

const assetImagePath = 'assets/images';
const logoImage = '$assetImagePath/logo.png';

const List<Widget> pages = [
  IntroStart(),
  BirthDatePage(),
  DiagnosisAgePage(),
  GenderSelectionPage(),
  ResidenceAreaPage(),
];

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  int currentPageIndex = 0; // 현재 페이지의 인덱스를 추적

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true, // title을 AppBar의 중앙에 위치
        title: Image.asset(
          logoImage,
          height: 24,
        ),
        leading: currentPageIndex > 0 // 이전 버튼 추가
            ? IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  setState(() {
                    if (currentPageIndex > 0) {
                      currentPageIndex--;
                    }
                  });
                },
              )
            : null, // 첫 번째 페이지에서는 '이전' 버튼을 숨김
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: LinearProgressIndicator(
              value: (currentPageIndex + 1) / pages.length,
              // 진도 표시를 위한 값 (0.0 ~ 1.0)
              backgroundColor: Colors.grey[300],
            ),
          ),
          Expanded(child: pages[currentPageIndex]), // 현재 인덱스의 페이지를 표시
        ],
      ),
      bottomNavigationBar: IntroNextButton(
        questionText: currentPageIndex == pages.length - 1 ? "완료" : "다음",
        // 마지막 페이지에서 "완료"로 변경
        onPressed: () {
          setState(() {
            if (currentPageIndex < pages.length - 1) {
              currentPageIndex++; // 다음 페이지로 이동
            }
          });
        },
      ),
    );
  }
}
