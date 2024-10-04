import 'package:flutter/material.dart';
import 'package:medy/data/medicine_dummy.dart';
import 'package:medy/data/vo/medicine.dart';
import 'package:medy/data/vo/user.dart';

class EditMyInfoScreen extends StatefulWidget {
  final User user; // User 객체를 받기 위한 필드

  const EditMyInfoScreen({super.key, required this.user});

  @override
  State<EditMyInfoScreen> createState() => _EditMyInfoScreenState();
}

class _EditMyInfoScreenState extends State<EditMyInfoScreen> {
  late User _user;
  final List<Medicine> _medicineList = [
    Medicine1,
    Medicine2,
    Medicine3,
    Medicine4
  ];

  @override
  void initState() {
    super.initState();
    _user = widget.user; // testUser2를 사용
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: const Color(0xff3888ff),
            height: 50,
          ),
          Container(
            height: 48,
            alignment: Alignment.centerLeft,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _buildInfoContainer(
                    title: '이름',
                    value: _user.nickname,
                    onTap: () {
                      _showEditNameDialog();
                    },
                  ),
                  _buildInfoContainer(
                    title: '생년월일',
                    value: _user.birthdate ?? '생년월일이 없습니다',
                    onTap: () {
                      _showEditBirthdateDialog();
                    },
                  ),
                  _buildInfoContainer(
                    title: '성별',
                    value: _user.sex == 'male' ? '남' : '여',
                    onTap: () {
                      _showEditGenderDialog();
                    },
                  ),
                  _buildInfoContainer(
                    title: '복용중인 약',
                    value: _user.medicine != null
                        ? _user.medicine!.name
                        : '복용중인 약이 없습니다',
                    onTap: () {
                      _showEditMedicineDialog();
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showEditNameDialog() {
    String updatedName = _user.nickname;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('이름 수정'),
          content: TextField(
            decoration: const InputDecoration(hintText: "이름 입력"),
            onChanged: (value) {
              updatedName = value;
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('취소'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _user = _user.copyWith(nickname: updatedName);
                });
                Navigator.of(context).pop();
              },
              child: const Text('저장'),
            ),
          ],
        );
      },
    );
  }

  void _showEditBirthdateDialog() async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (selectedDate != null) {
      setState(() {
        _user = _user.copyWith(
            birthdate:
                "${selectedDate.year}-${selectedDate.month}-${selectedDate.day}");
      });
    }
  }

  void _showEditGenderDialog() {
    String selectedGender = _user.sex;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('성별 수정'),
          content: DropdownButton<String>(
            value: selectedGender,
            items: <String>['male', 'female'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value == 'male' ? '남' : '여'),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                selectedGender = value!;
              });
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('취소'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _user = _user.copyWith(sex: selectedGender);
                });
                Navigator.of(context).pop();
              },
              child: const Text('저장'),
            ),
          ],
        );
      },
    );
  }

  void _showEditMedicineDialog() {
    Medicine? selectedMedicine = _user.medicine;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('복용중인 약 수정'),
          content: DropdownButton<Medicine>(
            value: selectedMedicine,
            items: _medicineList.map((Medicine medicine) {
              return DropdownMenuItem<Medicine>(
                value: medicine,
                child: Text(medicine.name),
              );
            }).toList(),
            onChanged: (Medicine? value) {
              setState(() {
                selectedMedicine = value;
              });
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('취소'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _user = _user.copyWith(medicine: selectedMedicine);
                });
                Navigator.of(context).pop();
              },
              child: const Text('저장'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildInfoContainer({
    required String title,
    required String value,
    required VoidCallback onTap,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              color: Color(0xffcccccc),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  value,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.edit, color: Color(0xffcccccc)),
                onPressed: onTap,
              ),
            ],
          ),
          const Divider(
            color: Color(0xffcccccc),
          ),
        ],
      ),
    );
  }
}
