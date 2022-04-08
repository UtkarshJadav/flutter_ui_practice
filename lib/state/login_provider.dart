import 'package:dio/dio.dart';

import 'package:flutter_demo/models/api_request_model.dart';
import 'package:flutter_demo/models/profile_response.dart';
import 'package:flutter_demo/utils/helpers/shared_pref_helper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:load/load.dart';
import 'package:image_picker/image_picker.dart';
import '../main.dart';
import '../utils/common/constants.dart';

final isLoggedIn = StateProvider<bool>((ref) {
  return false;
});

final authToken = StateProvider<String>((ref) {
  return '';
});
final profilePic = StateProvider.autoDispose<XFile?>((ref) {
  return null;
});
final profileError = StateProvider.autoDispose<dynamic>((ref) {
  return '';
});
final currUser = StateProvider<ProfileModel>((ref) {
  return ProfileModel();
});

final loginProvider =
    StateNotifierProvider<LoginController, void>((ref) => LoginController());

class LoginController extends StateNotifier<void> {
  LoginController() : super(0);

  loginUser(Reader read, String mobilenumber,{required Function onSuccess,required Function onError}) async {


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
          hideLoadingDialog();
         onSuccess(res);
    }).catchError((dynamic err) {

      hideLoadingDialog();
      onError(err);
    });

  }

  verifyOtp(Reader read, String mobileNumber, String otp,{required Function onSuccess,required Function onError}) async {
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
      onSuccess(res);
      hideLoadingDialog();
    }).catchError((dynamic err) {
      hideLoadingDialog();
      var error = err as DioError;
      print(error.response);
    });

    hideLoadingDialog();
  }


  buildProfile(Reader read, String firstName, String lastName,String email,String dob,{required Function onSuccess,required Function onError}) async {
    showLoadingDialog();

    ProfileModel? userData;

   await read(prefProvider)
         .getCurrUser()
        .then((value) =>
   userData = value
   );
   await read(apiProvider)
        .formDataQueryPostAPICall(
        APIConstant.userInformation,
        ApiRequest(
            firstName: firstName,
            lastName: lastName,
            email: email,
           birthDate : dob,
           method : "PUT",
            photo:  await MultipartFile.fromFile(read(profilePic.state).state?.path ?? "",filename: read(profilePic.state).state?.name ),
        ).toJson(),
         userData?.id,
    )
       .then((Response<dynamic> res) {
      onSuccess(res);
      hideLoadingDialog();
    }).catchError((dynamic err) {
      hideLoadingDialog();
      var error = err as DioError;
      print(error.response);
    });

    hideLoadingDialog();
  }




}
