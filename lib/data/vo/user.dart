import 'package:medy/data/vo/medicine.dart';

class User{
  final int id;
  final Medicine? medicine;
  final String? profileImagePath;
  final String nickname;
  final String sex;
  final String address;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final bool isPatient;

  User({
    required this.id,
    this.medicine,
    this.profileImagePath,
    required this.nickname,
    required this.sex,
    required this.address,
    this.createdAt,
    this.updatedAt,
    required this.isPatient,
  });
}