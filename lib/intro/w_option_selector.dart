import 'package:flutter/material.dart';

class OptionSelector extends StatefulWidget {
  final List<String> options;
  final Function(String?) onSelected;

  const OptionSelector({
    super.key,
    required this.options,
    required this.onSelected,
  });

  @override
  State<OptionSelector> createState() => _OptionSelectorState();
}

class _OptionSelectorState extends State<OptionSelector> {
  String? selectedOption;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget.options.map((option) => Column(
        children: [
          _buildOptionButton(option),
          const SizedBox(height: 10),
        ],
      )).toList(),
    );
  }

  Widget _buildOptionButton(String option) {
    bool isSelected = selectedOption == option;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedOption = option;
        });
        widget.onSelected(option);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF3888FF) : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? const Color(0xFF3888FF) : Colors.grey,
          ),
        ),
        child: Row(
          children: [
            Radio<String>(
              value: option,
              groupValue: selectedOption,
              onChanged: (String? value) {
                setState(() {
                  selectedOption = value;
                });
                widget.onSelected(value);
              },
              activeColor: Colors.white,
              fillColor: MaterialStateProperty.resolveWith<Color>((states) {
                if (states.contains(MaterialState.selected)) {
                  return Colors.white;
                }
                return const Color(0xFF3888FF);
              }),
            ),
            const SizedBox(width: 8),
            Text(
              option,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}