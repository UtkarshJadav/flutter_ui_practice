import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_demo/models/main_module_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:load/load.dart';
import '../main.dart';
import '../models/results.dart';
import '../utils/common/constants.dart';


final homeProvider =
StateNotifierProvider<HomeController, void>((ref) => HomeController());

class HomeController extends StateNotifier<void> {
  HomeController() : super(0);

  getMainModules(Reader read) async {

    showLoadingDialog();

    await read(apiProvider)
        .getAPICall(
        APIConstant.getMainModules,)
        .then((Response<dynamic> res) {
      var result = Results(create: ()=> MainModule()).fromJson(jsonDecode(res.data));
     // var result = Results<MainModule>.fromJson(jsonDecode(res.data),MainModule.fromJson,s: "list");
      print(result.data?[0].title ?? '');
      hideLoadingDialog();

   //   read(prefProvider).set(SharedPref.sessionId,result.data?.sessionId ?? '');
      return res;
    }).catchError((dynamic err) {
      hideLoadingDialog();
      err.hashCode.toString();
    });

    hideLoadingDialog();
    // bfc526be-1cef-473d-9b36-2b0bdf72c244
  }


}
