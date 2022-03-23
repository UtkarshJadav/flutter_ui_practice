import 'package:flutter/material.dart';
import 'package:flutter_demo/postauthentication/persistent_bottom_navigation_bar.dart';
import 'package:flutter_svg/svg.dart';

import '/../constants/constants.dart';

class AuthenticationSuccess extends StatefulWidget {
  const AuthenticationSuccess({Key? key}) : super(key: key);

  @override
  State<AuthenticationSuccess> createState() => _AuthenticationSuccessState();
}

class _AuthenticationSuccessState extends State<AuthenticationSuccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: SvgPicture.asset('assets/images/pana.svg')),
          const SizedBox(height: 20.0),
          const Text(
            'Authentication Successful',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w700,
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(22.0),
            child: Text(
              'Thank you for being part of FarmIt, Click on below button to get on dashboard.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 22, vertical: 22),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PersistentBottomNavigationBar(),
                  ),
                );
              },
              child: Container(
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                    color: primaryGreen,
                    borderRadius: BorderRadius.circular(30.0)),
                child: const Center(
                  child: Text(
                    'Go to Dashboard',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
