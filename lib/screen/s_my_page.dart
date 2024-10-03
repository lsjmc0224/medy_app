import 'package:flutter/material.dart';
import 'package:medy/data/vo/medicine.dart';
import 'package:medy/data/vo/user.dart';

class MyPage extends StatelessWidget {
  final User user;

  const MyPage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: const Color(0xff3888ff), // 페이지 배경색
          height: 50,
        ),
        SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProfileSection(user: user), // 전달된 유저 데이터 사용
                    const DividerWidget(),
                    MyMedicationSection(user: user), // 전달된 유저 데이터 사용
                    const DividerWidget(),
                    const CustomerSupportSection(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ProfileSection extends StatelessWidget {
  final User user;

  const ProfileSection({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${user.nickname} 님', // 유저의 닉네임 표시
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // 정보 수정 클릭 시 동작을 여기에 작성
                    },
                    child: const Text(
                      '정보 수정',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xffcccccc),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(
                'https://via.placeholder.com/150',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// 구분선 위젯
class DividerWidget extends StatelessWidget {
  const DividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      height: 4,
    );
  }
}

// 처방약 및 루틴 섹션 위젯
class PrescriptionRoutineSection extends StatelessWidget {
  const PrescriptionRoutineSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          '내 처방약 & 루틴',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        GestureDetector(
          onTap: () {
            // 정보 수정 클릭 시 동작을 여기에 작성
          },
          child: const Text(
            '정보 수정',
            style: TextStyle(
              fontSize: 16,
              color: Color(0xffcccccc),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),      ],
    );
  }
}

// 약 정보 박스 위젯
class MedicationBox extends StatelessWidget {
  final Medicine medicine;

  const MedicationBox({super.key, required this.medicine});

  @override
  Widget build(BuildContext context) {
    // 복용주기 표시 로직: 24시간을 넘으면 일 단위로 표시
    String cycleText;
    if (medicine.cycle > 24) {
      int days = (medicine.cycle / 24).floor();
      cycleText = '$days일';
    } else {
      cycleText = '${medicine.cycle}시간';
    }

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            spreadRadius: 3,
            blurRadius: 5,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(
              'https://via.placeholder.com/150',
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  medicine.company, // 약의 회사 이름 표시
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  medicine.name, // 약의 이름 표시
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Text(
            '$cycleText에 한 번', // 복용 주기 표시
            style: const TextStyle(
              fontSize: 16,
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}


// 처방약 및 루틴과 약 정보 박스 섹션 위젯
class MyMedicationSection extends StatelessWidget {
  final User user;

  const MyMedicationSection({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const PrescriptionRoutineSection(),
          const SizedBox(height: 16),
          if (user.isPatient && user.medicine != null) // 유저가 환자이고 약 정보가 있을 때만 표시
            MedicationBox(medicine: user.medicine!),
        ],
      ),
    );
  }
}

// 고객 지원 섹션 위젯
class CustomerSupportSection extends StatelessWidget {
  const CustomerSupportSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '고객 지원',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          const CustomerSupportItem(
            icon: Icons.bookmark,
            text: '내 북마크',
          ),
          const CustomerSupportItem(
            icon: Icons.description,
            text: '서비스 이용약관',
          ),
          const CustomerSupportItem(
            icon: Icons.lock,
            text: '개인정보 처리방침',
          ),
          const CustomerSupportItem(
            icon: Icons.settings,
            text: '내 계정 관리하기',
          ),
        ],
      ),
    );
  }
}

// 고객 지원 항목 위젯
class CustomerSupportItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const CustomerSupportItem({
    required this.icon,
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            Icon(icon, size: 24),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
