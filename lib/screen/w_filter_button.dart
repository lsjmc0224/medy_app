import 'package:flutter/material.dart';

class FilterButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const FilterButton({super.key, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3), // 그림자 위치
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}