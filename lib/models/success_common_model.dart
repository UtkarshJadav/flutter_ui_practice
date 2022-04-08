

import 'package:flutter_demo/models/results.dart';

class SuccessResponse implements Decodable<SuccessResponse> {

   String? message;


  Map<String, dynamic> toJson() => {
    'message' : message,

  };

  @override
  SuccessResponse fromJson(Map<String, dynamic> json) {
    message = json['message'] as String?;
    return this;
  }



}