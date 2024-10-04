import 'package:flutter/material.dart';
import 'package:medy/data/user_dummy.dart';
import 'package:medy/data/vo/medicine.dart';
import 'package:medy/data/vo/user.dart';
import 'package:medy/screen/s_edit_my_info.dart';

class MyPageFragment extends StatelessWidget {
  const MyPageFragment({super.key});

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
                    ProfileSection(user: testUser2, imageUrl: 'https://thumb.ac-illust.com/3d/3d6f681c0affe0d040e7c9e4d1e37a7a_w.jpeg',), // 전달된 유저 데이터 사용
                    const DividerWidget(),
                    MyMedicationSection(user: testUser2), // 전달된 유저 데이터 사용
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
  final String imageUrl;

  const ProfileSection({super.key, required this.user, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                    // EditMyInfo 페이지로 이동
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditMyInfoScreen(user: testUser2),
                      ),
                    );
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
            backgroundColor: const Color(0xffcccccc), // 배경색 설정 (이미지가 없을 때)
            child: ClipOval(
              child: Image.network(
                imageUrl, // 이미지 URL (없으면 빈 문자열)
                fit: BoxFit.cover,
                width: 80,
                height: 80,
                errorBuilder: (context, error, stackTrace) {
                  // 이미지 로딩 실패 시 대체 배경
                  return Container(
                    width: 80,
                    height: 80,
                    color: const Color(0xFFCCCCCC), // 배경색 #cccccc
                  );
                },
              ),
            ),
          ),
        ],
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
      color: const Color(0xffcccccc),
      height: 4,
    );
  }
}

// 처방약 및 루틴 섹션 위젯
class PrescriptionRoutineSection extends StatelessWidget {
  final User user;

  const PrescriptionRoutineSection({super.key, required this.user});

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
            // EditMyInfo 페이지로 이동
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EditMyInfoScreen(user: user),
                fullscreenDialog: true,
              ),
            );
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
    );
  }
}

// 약 정보 박스 위젯
class MedicationBox extends StatelessWidget {
  final Medicine medicine;
  final String? imageUrl;

  const MedicationBox({super.key, required this.medicine, required this.imageUrl});

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
            backgroundColor: Colors.grey[300], // 배경색 설정 (이미지가 없을 때)
            child: ClipOval(
              child: Image.network(
                imageUrl ?? '', // 이미지 URL (없으면 빈 문자열)
                fit: BoxFit.cover,
                width: 80,
                height: 80,
                errorBuilder: (context, error, stackTrace) {
                  // 이미지 로딩 실패 시 대체 배경
                  return Container(
                    width: 80,
                    height: 80,
                    color: const Color(0xFFCCCCCC), // 배경색 #cccccc
                  );
                },
              ),
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
          PrescriptionRoutineSection(
            user: user,
          ),
          const SizedBox(height: 16),
          if (user.isPatient &&
              user.medicine != null) // 유저가 환자이고 약 정보가 있을 때만 표시
            MedicationBox(medicine: user.medicine!, imageUrl: 'https://cdn.docdocdoc.co.kr/news/photo/201901/1064042_1122956_306.jpg',),
        ],
      ),
    );
  }
}

// 고객 지원 아이템에 대한 데이터 클래스 정의
class CustomerSupportItemData {
  final IconData icon;
  final String text;
  final Widget destination;

  CustomerSupportItemData({
    required this.icon,
    required this.text,
    required this.destination,
  });
}

// 고객 지원 섹션 위젯
class CustomerSupportSection extends StatelessWidget {
  const CustomerSupportSection({super.key});

  @override
  Widget build(BuildContext context) {
    // 각 지원 항목에 해당하는 데이터를 정의합니다.
    final List<CustomerSupportItemData> items = [
      CustomerSupportItemData(
        icon: Icons.bookmark,
        text: '내 북마크',
        destination: const BookmarkPage(), // todo:여기에 실제 페이지 위젯을 넣어야 합니다.
      ),
      CustomerSupportItemData(
        icon: Icons.description,
        text: '서비스 이용약관',
        destination: const TermsOfServicePage(), // todo:여기에 실제 페이지 위젯을 넣어야 합니다.
      ),
      CustomerSupportItemData(
        icon: Icons.lock,
        text: '개인정보 처리방침',
        destination: const PrivacyPolicyPage(), // todo:여기에 실제 페이지 위젯을 넣어야 합니다.
      ),
      CustomerSupportItemData(
        icon: Icons.settings,
        text: '내 계정 관리하기',
        destination: const AccountManagementPage(), // todo:여기에 실제 페이지 위젯을 넣어야 합니다.
      ),
    ];

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
          Column(
            children: items.map((item) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => item.destination,
                    ),
                  );
                },
                child: CustomerSupportItem(
                  icon: item.icon,
                  text: item.text,
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

// 고객 지원 아이템 위젯
class CustomerSupportItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const CustomerSupportItem({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, size: 24),
          const SizedBox(width: 16),
          Text(
            text,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}

// 예시로 사용할 페이지 위젯들
class BookmarkPage extends StatelessWidget {
  const BookmarkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('내 북마크')),
      body: const Center(child: Text('북마크 페이지')),
    );
  }
}

class TermsOfServicePage extends StatelessWidget {
  const TermsOfServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('서비스 이용약관')),
      body: const Center(child: Text('서비스 이용약관 페이지')),
    );
  }
}

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('개인정보 처리방침')),
      body: const Center(child: Text('개인정보 처리방침 페이지')),
    );
  }
}

class AccountManagementPage extends StatelessWidget {
  const AccountManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('내 계정 관리하기')),
      body: const Center(child: Text('계정 관리 페이지')),
    );
  }
}
