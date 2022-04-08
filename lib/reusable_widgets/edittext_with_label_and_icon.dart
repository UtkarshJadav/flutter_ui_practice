import 'package:flutter/material.dart';

import '../constants/constants.dart';

class EditTextLabel extends StatelessWidget {
   EditTextLabel(
      {Key? key,
        required this.labelName,
        required this.hintText,
        required this.icon,
        required this.controller,
         this.isEnable,
         this.validator,
      })
      : super(key: key);

  final String labelName;
  final String hintText;
  String? Function(String?)? validator;
  final IconData? icon;
   bool? isEnable = true;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 22, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(labelName),
           SizedBox(height: 6),
          TextFormField(
            enabled: isEnable,
            controller: controller,
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
              errorStyle: TextStyle(
                color: Theme.of(context).errorColor,
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: Theme.of(context).errorColor),
              ),
            ),
            validator: validator,
          ),
        ],
      ),
    );
  }
}
