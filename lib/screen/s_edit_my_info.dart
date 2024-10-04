import 'package:flutter/material.dart';
import 'package:medy/data/vo/user.dart';

class EditMyInfoScreen extends StatefulWidget {
  final User user;

  const EditMyInfoScreen({super.key, required this.user});

  @override
  State<EditMyInfoScreen> createState() => _EditMyInfoScreenState();
}

class _EditMyInfoScreenState extends State<EditMyInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
