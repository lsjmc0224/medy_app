import 'package:medy/data/medicine_dummy.dart';
import 'package:medy/data/vo/user.dart';

final testUser1 = User(
  id: 1,
  nickname: 'SangjunLee',
  sex: 'male',
  address: '경기도 광주시 오포읍',
  isPatient: false,
);
final testUser2 = User(
  id: 2,
  nickname: 'JihoonChang',
  sex: 'male',
  address: '경기도 광주시 신현리',
  isPatient: true,
  medicine: Medicine1,
);
