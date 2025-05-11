import 'package:flutter/material.dart';

class CustomSearchField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Function(String)? onChanged;
  final bool home;

  const CustomSearchField(
      {super.key,
      required this.controller,
      this.hintText = "Try " "Android dev" "",
      this.onChanged,
      this.home = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      height:home? 65:40,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: home ? 8 : 0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintStyle: TextStyle(
              color: home ? const Color(0xffb2b7bf): Colors.black),
          contentPadding:  EdgeInsets.only(top:home? 14:4),
          suffixIcon: home
              ? const Icon(
                  Icons.qr_code_scanner,
                  color: Color(0xFF4e7c83),
                  size: 30,
                )
              : null,
          prefixIcon: Icon(
            Icons.search_sharp,
            color: home ? const Color(0xFF4e7c83) : Colors.black,
            size:home? 30:20,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
