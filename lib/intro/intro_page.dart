import 'package:flutter/material.dart';
import 'package:medy/intro/s_birth_date.dart';
import 'package:medy/intro/s_diagnosis_age.dart';
import 'package:medy/intro/s_family_history.dart';
import 'package:medy/intro/s_fav_hospital.dart';
import 'package:medy/intro/s_gender_select.dart';
import 'package:medy/intro/s_hemophilia_type.dart';
import 'package:medy/intro/s_patient_or_guardian.dart';
import 'package:medy/intro/s_self_injection.dart';
import 'package:medy/intro/s_serverity_level.dart';
import 'package:medy/intro/s_surgery_experience.dart';
import 'package:medy/intro/s_trip_freq.dart';
import 'package:medy/intro/s_user_funnel.dart';
import 'package:medy/intro/w_intro_next_button.dart';
import 'package:medy/intro/s_residence_area.dart';
import 'package:medy/intro/s_start.dart';

const assetImagePath = 'assets/images';
const logoImage = '$assetImagePath/logo.png';

const List<Widget> questionList = [
  IntroStart(),
  BirthDate(),
  DiagnosisAge(),
  GenderSelection(),
  ResidenceArea(),
  FavoriteHospital(),
  TripFrequency(),
  SurgeryExperience(),
  HemophiliaType(),
  SeverityLevel(),
  FamilyHistory(),
  SelfInjection(),
  PatientOrGuardian(),
  // PreventiveUseDays(),
  // AlarmTimeSetting(),
  UserFunnel(),
];

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(
          logoImage,
          height: 24,
        ),
        leading: currentPageIndex > 0
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
            : null,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: LinearProgressIndicator(
              value: (currentPageIndex + 1) / questionList.length,
              backgroundColor: Colors.grey[300],
            ),
          ),
          Expanded(child: questionList[currentPageIndex]),
        ],
      ),
      bottomNavigationBar: IntroNextButton(
        questionText: currentPageIndex == questionList.length - 1 ? "완료" : "다음",
        onPressed: () {
          if (currentPageIndex < questionList.length - 1) {
            setState(() {
              currentPageIndex++;
            });
          } else {
            // 완료 버튼을 눌렀을 때 /mainScreen으로 이동
            Navigator.pushReplacementNamed(context, '/mainScreen');
          }
        },
      ),
    );
  }
}
