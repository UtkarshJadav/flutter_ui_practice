import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_demo/models/api_request_model.dart';
import 'package:flutter_demo/models/profile_response.dart';
import 'package:flutter_demo/utils/helpers/shared_pref_helper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:load/load.dart';

import '../main.dart';
import '../models/login_response_model.dart';
import '../models/results.dart';
import '../utils/common/constants.dart';

final isLoggedIn = StateProvider<bool>((ref) {
  return false;
});
final authToken = StateProvider<String>((ref) {
  return '';
});
final currUser = StateProvider<ProfileModel>((ref) {
  return ProfileModel();
});

final loginProvider =
    StateNotifierProvider<LoginController, void>((ref) => LoginController());

class LoginController extends StateNotifier<void> {
  LoginController() : super(0);

  loginUser(Reader read, String mobilenumber) async {
    showLoadingDialog();

    await read(apiProvider)
        .postAPICall(
            APIConstant.register,
            ApiRequest(
                    mobile: mobilenumber,
                    deviceType: APIConstant.ANDROID,
                    deviceToken: 'token123token123token123')
                .toJson())
        .then((Response<dynamic> res) {
      var result = Results(create: () => LoginResponse()).fromJson(jsonDecode(res.data));
      print(result.data?.sessionId ?? '');
      hideLoadingDialog();
      read(prefProvider)
          .set(SharedPref.sessionId, result.data?.sessionId ?? '');
      return result.data?.sessionId;
    }).catchError((dynamic err) {
      hideLoadingDialog();
      err.hashCode.toString();
    });
    /*await Future.delayed(Duration(seconds: 2));
    print(mobilenumber);
*/
    hideLoadingDialog();
    // bfc526be-1cef-473d-9b36-2b0bdf72c244
  }

  verfyOtp(Reader read, String mobileNumber, String otp) async {
    showLoadingDialog();
    String? sessionid;
    read(prefProvider)
        .getString(SharedPref.sessionId)
        .then((value) => sessionid = value);
    read(apiProvider)
        .postAPICall(
            APIConstant.verifyOtp,
            ApiRequest(
                    mobile: mobileNumber,
                    deviceType: APIConstant.ANDROID,
                    deviceToken: 'token123token123token123',
                    otp: otp,
                    sessionId: sessionid)
                .toJson())
        .then((Response<dynamic> res) {
       var result = Results(create: () => ProfileModel()).fromJson(jsonDecode(res.data));
        print(result.extraMeta?.token ?? '');
        print(result.data?.email ?? '');

       read(prefProvider).setToken(result.extraMeta?.token ?? '');
        read(prefProvider).setUser(result.data?.toJson().toString() ?? '');
      hideLoadingDialog();
    }).catchError((dynamic err) {
      hideLoadingDialog();
      var error = err as DioError;
      print(error.response);
    });

    hideLoadingDialog();
  }
}
