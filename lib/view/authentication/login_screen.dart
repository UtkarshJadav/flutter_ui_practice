import 'dart:convert';

import 'package:flutter/material.dart';
import '../../main.dart';
import '../../models/login_response_model.dart';
import '../../models/results.dart';
import '../../state/login_provider.dart';
import '../../utils/helpers/shared_pref_helper.dart';
import '../authentication/otp_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_demo/constants/constants.dart';
import 'package:flutter_svg/svg.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context,ref) {

    TextEditingController controller = TextEditingController();
    ref.read(prefProvider).set(SharedPref.walkThroughVisited, true);
    return Scaffold(
      backgroundColor: colorNavyBlue,
      body: Stack(
        children: [

          SizedBox(
            width: double.infinity,
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 12),
                    child: SvgPicture.asset('assets/images/logo.svg'),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 22, vertical: 12),
                    child: Text(
                      'Let’s Get Started',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30.0,
                          color: Colors.white),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 22, vertical: 12),
                    child: Text(
                      'FarmIt Crop management platform uses powerful hardware/software solutions',
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 22.0,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(22.0),
                  topRight: Radius.circular(22.0),
                ),
              ),
              child: ListView(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(22, 0, 22, 0),
                    child: Text(
                      'Phone Number',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(22, 12, 22, 0),
                    child: TextField(
                      controller: controller,
                      maxLength: 10,
                      cursorColor: colorNavyBlue,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w600),
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        prefixIcon:Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12.0,horizontal: 10),
                          child: Text("+91",style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),),
                        ),

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
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 22, vertical: 12),
                    child: RichText(
                      text: const TextSpan(
                        text: 'By Continuing you are agree with',
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 15,
                          color: Colors.black,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: ' Terms of Service',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.green),
                          ),
                          TextSpan(
                            text: ' and',
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                color: Colors.black),
                          ),
                          TextSpan(
                            text: ' Privacy Policy',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.green),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 22, vertical: 8),
                    child: InkWell(
                      onTap: () {
                           ref.read(loginProvider.notifier).loginUser(ref.read,"+91"+controller.text,
                            onSuccess : (res){
                              var result = Results(create: () => LoginResponse()).fromJson(jsonDecode(res.data));
                              print(result.data?.sessionId ?? '');
                              ref.read(prefProvider)
                                  .set(SharedPref.sessionId, result.data?.sessionId ?? '');
                              ref.read(prefProvider)
                                  .set(SharedPref.sessionId,'bfc526be-1cef-473d-9b36-2b0bdf72c244');
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => OTPScreen(mobileNumber : controller.text),
                                ),
                              );
                        },
                        onError: (error){
                          print(error);
                        });
                      },
                      child: Container(
                        width: double.infinity,
                        height: 60,
                        decoration: BoxDecoration(
                          color: primaryGreen,
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: const Center(
                          child: Text(
                            'Continue',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
