import 'package:eventpass_app/presentation/misc/colors.dart';
import 'package:eventpass_app/presentation/misc/methods.dart';
import 'package:flutter/material.dart';

class CustomDropDown extends StatefulWidget {
  final List<String> categories;
  final String labelText;
  final String hintText;
  final Function(String)? onSelect;

  const CustomDropDown(
      {super.key,
      required this.categories,
      required this.labelText,
      required this.hintText,
      this.onSelect});

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  String? _selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.labelText,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
        ),
        verticalSpace(4),
        DropdownButtonFormField(
          hint: Text(
            widget.hintText,
            style: const TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w300,
            ),
          ),
          value: _selectedCategory,
          items: widget.categories.map((String category) {
            return DropdownMenuItem<String>(
              value: category,
              child: Text(
                category,
                style: const TextStyle(
                  fontSize: 16,
                  color: ghostBlack,
                  fontWeight: FontWeight.w400,
                ),
              ),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              _selectedCategory = newValue;
            });
            widget.onSelect?.call(newValue!);
          },
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: ghost.withOpacity(0.5)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(color: darkBlue),
            ),
          ),
          dropdownColor: Colors.white, // Warna dropdown saat dibuka
          icon: const Icon(
            Icons.arrow_drop_down,
            color: Colors.black,
          ), // Warna icon dropdown
        ),
      ],
    );
  }
}
