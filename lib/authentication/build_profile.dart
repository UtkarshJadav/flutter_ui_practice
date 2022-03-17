import 'package:flutter/material.dart';
import 'package:flutter_demo/authentication/setup_orchard.dart';
import '../constants/constants.dart';
import 'package:flutter_svg/svg.dart';

import '../reusable_widgets/edittext_with_label_and_icon.dart';

class BuildProfile extends StatefulWidget {
  const BuildProfile({Key? key}) : super(key: key);

  @override
  State<BuildProfile> createState() => _BuildProfileState();
}

class _BuildProfileState extends State<BuildProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorNavyBlue,
      appBar: AppBar(
        backgroundColor: colorNavyBlue,
        elevation: 0,
        title: const Text(
          'Let’s build your profile',
          style: TextStyle(
              fontWeight: FontWeight.w500, fontSize: 22.0, color: Colors.white),
        ),
      ),

      body: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height / 1.15,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(22.0),
              topRight: Radius.circular(22.0),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, MediaQuery.of(context).size.height * 0.02),
                      height: MediaQuery.of(context).size.height * 0.15,
                      width: MediaQuery.of(context).size.height * 0.15,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(22),
                          border: Border.all(color: Colors.grey, width: 1.0)),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(22),
                            image: const DecorationImage(
                              image: AssetImage('assets/images/ic_splash.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: SvgPicture.asset('assets/images/upload_profile.svg'),
                  ),
                ],
              ),
              const EditTextLabel(
                  labelName: 'First name',
                  hintText: 'First name',
                  icon: Icons.account_circle_rounded),
              const EditTextLabel(
                  labelName: 'Last name',
                  hintText: 'Last name',
                  icon: Icons.account_circle_rounded),
              const EditTextLabel(
                  labelName: 'Email',
                  hintText: 'Email',
                  icon: Icons.email),
              const EditTextLabel(
                  labelName: 'Date Of Birth',
                  hintText: 'Date Of Birth',
                  icon: Icons.calendar_today_rounded),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 22, vertical: 22),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SetUpOrchardScreen(),
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
                        'Continue',
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
        ),
      ),
    );
  }
}