import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_demo/state/login_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../utils/helpers/shared_pref_helper.dart';
import '/../constants/constants.dart';
import '../../main.dart';
import '../../models/profile_response.dart';
import '../../models/results.dart';
import '../authentication/build_profile.dart';

class OTPScreen extends ConsumerWidget {
  String? mobileNumber;
  String? otp;

  OTPScreen({Key? key, this.mobileNumber}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
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
                      'Verify OTP',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30.0,
                          color: Colors.white),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 22, vertical: 12),
                    child: Text(
                      'Confirm your one time password to verify your mobile number',
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
                      'Verify OTP',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 22,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(40, 12, 40, 8),
                    child: Text(
                      'Enter one time password (OTP) sent to \n +91 ${mobileNumber?.substring(0, 4) ?? ''} XXX',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(25, 12, 25, 0),
                    child: PinCodeTextField(
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                      cursorColor: colorNavyBlue,
                      length: 6,
                      obscureText: false,
                      animationType: AnimationType.fade,
                      pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(12),
                          borderWidth: 2,
                          fieldHeight: 55,
                          fieldWidth: 55,
                          activeColor: Colors.grey.shade700,
                          inactiveColor: Colors.grey.shade400,
                          selectedColor: Colors.grey.shade400,
                          activeFillColor: Colors.white,
                          selectedFillColor: Colors.white,
                          inactiveFillColor: Colors.white),
                      animationDuration: const Duration(milliseconds: 300),
                      enableActiveFill: true,
                      beforeTextPaste: (text) {
                        print("Allowing to paste $text");
                        //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                        //but you can show anything you want here, like your pop up saying wrong paste format or etc
                        return true;
                      },
                      appContext: context,
                      onChanged: (String value) {
                        otp = value;
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 22, vertical: 8),
                    child: InkWell(
                      onTap: () {
                        ref
                            .read(loginProvider.notifier)
                            .verifyOtp(ref.read, '+91$mobileNumber', otp ?? '0',
                                onSuccess: (res) {
                          var result = Results(create: () => ProfileModel())
                              .fromJson(jsonDecode(res.data));
                              print(result.extraMeta?.token ?? '');
                              print(result.data?.email ?? '');
                              ref
                                 .read(prefProvider)
                                 .setToken(result.extraMeta?.token ?? '');
                                ref
                                 .read(prefProvider)
                                 .setUser(jsonEncode(result.data?.toJson()) ?? '');
                            ref.read(prefProvider)
                              .set(SharedPref.loggedIn, true);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BuildProfile(),
                            ),
                          );
                        }, onError: (error) {});
                      },
                      child: Container(
                        width: double.infinity,
                        height: 60,
                        decoration: BoxDecoration(
                            color: primaryGreen,
                            borderRadius: BorderRadius.circular(30.0)),
                        child: const Center(
                          child: Text(
                            'Verify',
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
          )
        ],
      ),
    );
  }
}
