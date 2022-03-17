import 'package:flutter/material.dart';

import '../constants/constants.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorNavyBlue,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: colorNavyBlue,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.all(12.0),
          child: RichText(
            text: const TextSpan(
              text: 'Welcome,',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 26,
                color: Colors.white,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: ' John',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: primaryGreen),
                )
              ],
            ),
          ),
        ),
      ),
      body: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height / 1.5,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(22.0),
              topRight: Radius.circular(22.0),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

              ],
            ),
          ),
        ),
      ),
    );
  }
}
