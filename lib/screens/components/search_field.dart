import 'package:d_pos/constants/constants.dart';
import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          hintText: 'search for inventory',
          helperStyle: TextStyle(
            color: textColor.withOpacity(0.5),
            fontSize: 14,
          ),
          fillColor: secondaryColor,
          filled: true,
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10)),
          prefixIcon: Icon(
            Icons.search,
            color: textColor.withOpacity(0.5),
          )),
    );
  }
}
