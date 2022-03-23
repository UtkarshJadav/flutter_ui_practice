

import 'package:flutter_demo/models/results.dart';

class LoginResponse implements Decodable<LoginResponse> {
   int? isOrchardAdded;
   int? isProfileAdded;
   String? sessionId;
   int? isNewUser;
   int? isSubscribed;

  Map<String, dynamic> toJson() => {
    'isOrchardAdded' : isOrchardAdded,
    'isProfileAdded' : isProfileAdded,
    'session_id' : sessionId,
    'is_new_user' : isNewUser,
    'is_subscribed' : isSubscribed
  };

  @override
  LoginResponse fromJson(Map<String, dynamic> json) {
    isOrchardAdded = json['isOrchardAdded'] as int?;
    isProfileAdded = json['isProfileAdded'] as int?;
    sessionId = json['session_id'] as String?;
    isNewUser = json['is_new_user'] as int?;
    isSubscribed = json['is_subscribed'] as int?;

    return this;
  }



}