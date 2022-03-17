import 'package:flutter/material.dart';

import '../constants/constants.dart';

class EditTextLabel extends StatelessWidget {
  const EditTextLabel(
      {Key? key,
        required this.labelName,
        required this.hintText,
        required this.icon})
      : super(key: key);

  final String labelName;
  final String hintText;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(labelName),
          const SizedBox(height: 6),
          TextField(
            cursorColor: colorNavyBlue,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            decoration: InputDecoration(
              suffixIcon: Align(
                widthFactor: 1.0,
                heightFactor: 1.0,
                child: Icon(
                  icon,
                  color: Colors.grey,
                ),
              ),
              hintText: hintText,
              contentPadding:
              const EdgeInsets.symmetric(horizontal: 22, vertical: 20),
              prefixStyle:
              const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: Colors.grey),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: Colors.grey),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
