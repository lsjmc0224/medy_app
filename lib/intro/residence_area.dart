import 'package:flutter/material.dart';
import 'package:medy/intro/question_text.dart';

class ResidenceAreaPage extends StatefulWidget {
  const ResidenceAreaPage({super.key});

  @override
  State<ResidenceAreaPage> createState() => _ResidenceAreaPageState();
}

class _ResidenceAreaPageState extends State<ResidenceAreaPage> {
  final TextEditingController resAreaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          const QuestionText(text: "현재 어느 지역에 거주 중인가요?"),
          const SizedBox(height: 20),

          // 거주 중인 지역을 작성하는 input widget
          TextFormField(
            // TODO: string 형태로 적어주면 매 0.3초마다 검색결과 갱신
            // TODO: 한국어 인풋 안되는 거 해결
            controller: resAreaController,
            decoration: const InputDecoration(
              labelText: "지역으로 검색",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),

          // 현재 위치로 찾기 버튼
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              // TODO: onPressed 시 검색 진행 후 현재 location을 location 함수에 넣어서 검색
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF3888FF), // 버튼 배경색을 #3888FF로 설정
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: const Text(
                "현재위치로 찾기",
                style: TextStyle(
                  color: Colors.white, // 글자색을 하얀색으로 설정
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          // 검색 결과가 나오는 영역
          Expanded(
            child: Container(
              // TODO: 검색결과 받아서 필터링 ( default 값은 가나다 순으로 )
              color: Colors.yellow, // 이곳에 실제 UI 요소를 넣을 수 있습니다.
              child: const Center(child: Text("검색결과 표시 영역")),
            ),
          ),
          Container(height: 50,)
        ],
      ),
    );
  }
}
