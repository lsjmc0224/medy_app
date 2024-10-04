import 'package:medy/data/vo/medicine.dart';

class User {
  final int id;
  final Medicine? medicine;
  final String? profileImagePath;
  final String nickname;
  final String sex;
  final String address;
  final String birthdate;
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
    required this.birthdate,
    this.createdAt,
    this.updatedAt,
    required this.isPatient,
  });

  User copyWith({
    int? id,
    Medicine? medicine,
    String? profileImagePath,
    String? nickname,
    String? sex,
    String? address,
    String? birthdate,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? isPatient,
  }) {
    return User(
      id: id ?? this.id,
      medicine: medicine ?? this.medicine,
      profileImagePath: profileImagePath ?? this.profileImagePath,
      nickname: nickname ?? this.nickname,
      sex: sex ?? this.sex,
      address: address ?? this.address,
      birthdate: birthdate ?? this.birthdate,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isPatient: isPatient ?? this.isPatient,
    );
  }
}
