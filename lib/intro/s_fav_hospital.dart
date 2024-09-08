import 'package:flutter/material.dart';
import 'package:medy/intro/w_question_text.dart';

class FavoriteHospital extends StatefulWidget {
  const FavoriteHospital({super.key});

  @override
  State<FavoriteHospital> createState() => _FavoriteHospitalState();
}

class _FavoriteHospitalState extends State<FavoriteHospital> {
  final TextEditingController resHostpialController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          const QuestionText(text: "주로 약을 처방받는 병원은\n어느 병원인가요?"),
          Text(
            "어떠한 금전적 지원도 받지 않았어요",
            style: TextStyle(
              fontSize: 20,
              color: Color(0xff888888),
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            // TODO: string 형태로 적어주면 매 0.3초마다 검색결과 갱신
            // TODO: 한국어 인풋 안되는 거 해결
            controller: resHostpialController,
            decoration: const InputDecoration(
              labelText: "병원이름으로 검색",
              border: OutlineInputBorder(),
            ),
          ),
          Expanded(
            child: Container(
              // TODO: 검색결과 받아서 필터링 ( default 값은 가나다 순으로 )
              color: Colors.yellow, // 이곳에 실제 UI 요소를 넣을 수 있습니다.
              child: const Center(child: Text("검색결과 표시 영역")),
            ),
          ),
        ],
      ),
    );
  }
}
